import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final themeHelperProvider = Provider<ThemeHelper>((ref) {
  return ThemeHelper();
});

class ThemeHelper {
  final _box = GetStorage();
  final _key = "theme";
  ThemeMode themeMode() {
    final themeValue = _box.read(_key);
    if (themeValue == null) {
      return ThemeMode.system;
    }
    return ThemeMode.values[themeValue];
  }

  void updateThemeMode(ThemeMode themeMode) {
    _box.write(_key, themeMode.index);
  }
}
