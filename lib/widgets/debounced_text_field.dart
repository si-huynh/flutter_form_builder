import 'dart:async';
import 'package:flutter/material.dart';

class DebouncedTextField extends StatefulWidget {

  const DebouncedTextField({
    required this.onChanged,
    this.initialValue = '',
    this.decoration,
    this.maxLines = 1,
    this.debounceDuration = const Duration(milliseconds: 500),
    this.controller,
    this.keyboardType,
    this.autofocus = false,
    this.focusNode,
    super.key,
  });
  final String initialValue;
  final ValueChanged<String> onChanged;
  final InputDecoration? decoration;
  final int? maxLines;
  final Duration debounceDuration;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool autofocus;
  final FocusNode? focusNode;

  @override
  State<DebouncedTextField> createState() => _DebouncedTextFieldState();
}

class _DebouncedTextFieldState extends State<DebouncedTextField> {
  late TextEditingController _controller;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller =
        widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(DebouncedTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null && widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue;
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(widget.debounceDuration, () {
      if (mounted) {
        widget.onChanged(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: widget.decoration,
      maxLines: widget.maxLines,
      onChanged: _onChanged,
      keyboardType: widget.keyboardType,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
    );
  }
}
