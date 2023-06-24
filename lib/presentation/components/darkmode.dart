// import 'package:flutter/material.dart';
// import 'package:mhzukan/domain/entities/UserSetting.dart';
// import 'package:provider/provider.dart';
// import '../../domain/repositories/User.dart';

// class DarkModeToggleWidget extends StatefulWidget {
//   const DarkModeToggleWidget({Key? key}) : super(key: key);

//   @override
//   _DarkModeToggleWidgetState createState() => _DarkModeToggleWidgetState();
// }

// class _DarkModeToggleWidgetState extends State<DarkModeToggleWidget> {
//   bool _isDarkModeEnabled = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadDarkModeSetting();
//   }

//   Future<void> _loadDarkModeSetting() async {
//     final appSettingsRepository = context.read<UserRepository>();
//     final appSettings = await appSettingsRepository.load();
//     setState(() {
//       _isDarkModeEnabled = appSettings.setting.isDarkModeEnabled;
//     });
//   }

//   Future<void> _saveDarkModeSetting(bool isEnabled) async {
//     final appSettingsRepository = context.read<UserRepository>();
//     final appSettings = UserSetting(isDarkModeEnabled: isEnabled);
//     await appSettingsRepository.save(appSettings);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SwitchListTile(
//       title: const Text('Dark Mode'),
//       value: _isDarkModeEnabled,
//       onChanged: (value) {
//         setState(() {
//           _isDarkModeEnabled = value;
//         });
//         _saveDarkModeSetting(value);
//       },
//     );
//   }
// }