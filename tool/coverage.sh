#!/bin/bash

# Exit on error
set -e

# Set paths for coverage
LCOV_FILE="coverage/lcov.info"
HTML_OUTPUT="coverage/html"

# Run Flutter tests with coverage
echo "Running tests with coverage..."
flutter test --coverage

# Manual filtering of generated files
echo "Filtering generated files from coverage report..."
# Create a temporary file
TEMP_FILE=$(mktemp)

# Add files to be excluded in this array
EXCLUDE_PATTERNS=(
  ".g.dart"
  ".freezed.dart"
  ".config.dart"
  "_generated.dart"
  "generated_plugin_registrant.dart"
  ".gr.dart"
)

# Read lcov file, filter out sections for excluded files, and write to temp file
current_file=""
skip_section=false
filtered_count=0

while IFS= read -r line; do
  if [[ $line == SF:* ]]; then
    current_file=${line#SF:}
    skip_section=false
    
    # Check if current file matches any exclude pattern
    for pattern in "${EXCLUDE_PATTERNS[@]}"; do
      if [[ $current_file == *"$pattern"* ]]; then
        skip_section=true
        ((filtered_count++))
        echo "Excluding $current_file"
        break
      fi
    done
  fi
  
  if [[ $skip_section == false ]]; then
    echo "$line" >> "$TEMP_FILE"
  elif [[ $line == "end_of_record" ]]; then
    skip_section=false
  fi
done < "$LCOV_FILE"

# Replace original lcov file with filtered content
mv "$TEMP_FILE" "$LCOV_FILE"
echo "Removed $filtered_count generated files from coverage report"

# Generate HTML report
echo "Generating HTML report..."
genhtml "$LCOV_FILE" -o "$HTML_OUTPUT"

# Summary statistics
echo ""
echo "Coverage report generated at $HTML_OUTPUT/index.html"
echo ""

# Find files with low coverage (under 85%)
echo "Files with coverage under 85%:"
cat "$LCOV_FILE" | grep -E "SF:|LF:|LH:" | awk 'BEGIN {FS=":"} 
  /SF:/ {file=$2} 
  /LF:/ {lf=$2} 
  /LH:/ {
    if (lf>0) {
      coverage = $2/lf*100;
      if (coverage < 85) {
        printf "%-60s %5.1f%% (%d/%d lines)\n", file, coverage, $2, lf
      }
    }
  }' | sort -k2 -n

echo ""
total_lines=$(grep -m1 "lines.*%" coverage/html/index.html | sed -E 's/.*>([0-9.]+)%.*/\1/')
echo "Overall coverage: $total_lines%"

# Open report on macOS (if running on macOS)
# if [[ "$OSTYPE" == "darwin"* ]]; then
#   echo ""
#   echo "Opening coverage report..."
#   open "$HTML_OUTPUT/index.html"
# fi 