import 'package:shared_preferences/shared_preferences.dart';

import 'model.dart';

abstract class Setting {
  Future<void> saveSettings(SettingData data);
  Future<UserData> getSettings();
}

class SettingImpl implements Setting {
  static const String keyIsDarkModeEnabled = 'isDarkModeEnabled';

  @override
  Future<void> saveSettings(SettingData settings) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(keyIsDarkModeEnabled, settings.isMode);
  }

  @override
  Future<UserData> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkModeEnabled = prefs.getBool(keyIsDarkModeEnabled) ?? false;
    return UserData(
      id: 0,
      name: "",
      setting: SettingData(isMode: isDarkModeEnabled));
  }
}