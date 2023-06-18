import 'package:flutter/material.dart';

abstract class ThemeModeRepository {
  Future<ThemeMode> getThemeMode();
  Future<void> setThemeMode(ThemeMode mode);
}