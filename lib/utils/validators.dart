class FormValidators {
  static String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateOptions(List<String> options) {
    if (options.isEmpty) {
      return 'Add at least one option';
    }
    if (options.length > 5) {
      return 'Maximum 5 options allowed';
    }
    return null;
  }
}
