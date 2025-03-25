import 'dart:async';
import 'package:flutter/material.dart';

mixin DebounceMixin<T extends StatefulWidget> on State<T> {
  final Map<String, Timer> _debounceTimers = {};
  final Map<String, TextEditingController> _controllers = {};

  TextEditingController getController(String key, {String initialText = ''}) {
    return _controllers.putIfAbsent(key, () {
      final controller = TextEditingController(text: initialText);
      return controller;
    });
  }

  void debounce(
    String key,
    VoidCallback action, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    _debounceTimers[key]?.cancel();
    _debounceTimers[key] = Timer(duration, action);
  }

  void cancelDebounce(String key) {
    _debounceTimers[key]?.cancel();
    _debounceTimers.remove(key);
  }

  void disposeDebounce() {
    for (final timer in _debounceTimers.values) {
      timer.cancel();
    }
    _debounceTimers.clear();
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    _controllers.clear();
  }

  @override
  void dispose() {
    disposeDebounce();
    super.dispose();
  }
}
