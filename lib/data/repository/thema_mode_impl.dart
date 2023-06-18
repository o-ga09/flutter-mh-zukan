import 'package:flutter/material.dart';
import 'package:mhzukan/data/repository/thema_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeRepositoryImpl implements ThemeModeRepository {
  static const String themeModeKey = 'theme_mode';

  @override
  Future<ThemeMode> getThemeMode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final modeIndex = sharedPreferences.getInt(themeModeKey) ?? 0;
    return ThemeMode.values[modeIndex];
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final modeIndex = ThemeMode.values.indexOf(mode);
    await sharedPreferences.setInt(themeModeKey, modeIndex);
  }
}