import 'package:flutter/material.dart';

class ThemeModeNotifier extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;

  ThemeMode get mode => _mode;

  void update(ThemeMode newMode) {
    _mode = newMode;
    notifyListeners();
  }
}