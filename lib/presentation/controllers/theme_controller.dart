import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  static const String _themeKey = 'theme_mode';

  @override
  ThemeMode build() {
    _loadThemeFromPreferences();
    return ThemeMode.system;
  }

  Future<void> _loadThemeFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey);

    if (themeIndex != null) {
      final themeMode = ThemeMode.values[themeIndex];
      state = themeMode;
    }
  }

  Future<void> _saveThemeToPreferences(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
  }

  void toggleTheme() {
    final newMode = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.light,
    };

    state = newMode;
    _saveThemeToPreferences(newMode);
  }

  void setThemeMode(ThemeMode mode) {
    state = mode;
    _saveThemeToPreferences(mode);
  }

  void setSystemTheme() {
    state = ThemeMode.system;
    _saveThemeToPreferences(ThemeMode.system);
  }
}
