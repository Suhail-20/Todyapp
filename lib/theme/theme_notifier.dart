import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:todyapp/theme/theme_helper.dart';

// The provider for the theme state.
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  final themeHelper = ref.watch(themeHelperProvider);
  return ThemeNotifier(themeHelper);
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  final ThemeHelper _themeHelper;

  ThemeNotifier(this._themeHelper) : super(_themeHelper.themeMode());

  // Method to toggle between light and dark mode
  void toggleTheme() {
    final newTheme = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    _themeHelper.updateThemeMode(newTheme);
    state = newTheme;
  }
}
