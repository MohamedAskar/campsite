import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/shared_preferences_provider.dart';

part 'theme_controller.g.dart';

@riverpod
class ThemeController extends _$ThemeController {
  static const String _themeKey = 'theme_mode';

  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPreferencesProvider);
    final themeIndex = prefs.getInt(_themeKey);

    if (themeIndex != null &&
        themeIndex >= 0 &&
        themeIndex < ThemeMode.values.length) {
      return ThemeMode.values[themeIndex];
    }

    return ThemeMode.system;
  }

  Future<void> _saveThemeToPreferences(ThemeMode mode) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(_themeKey, mode.index);
  }

  Future<void> toggleTheme() async {
    final newMode = switch (state) {
      ThemeMode.light => ThemeMode.dark,
      ThemeMode.dark => ThemeMode.light,
      ThemeMode.system => ThemeMode.light,
    };

    state = newMode;
    await _saveThemeToPreferences(newMode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    await _saveThemeToPreferences(mode);
  }

  Future<void> setSystemTheme() async {
    state = ThemeMode.system;
    await _saveThemeToPreferences(ThemeMode.system);
  }
}
