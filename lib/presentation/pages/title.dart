// import 'package:flutter/material.dart';
// import 'package:mhzukan/infrastructure/repository/pokemon.dart';
// import 'package:mhzukan/presentation/pages/pokemon.dart';
// import 'package:mhzukan/presentation/pages/setting.dart';
// import 'package:provider/provider.dart';

// import '../../domain/usecases/main.dart';

// class TitleScreen extends StatefulWidget {
//   final GoToMainScreenUsecase goToMainScreenUsecase;

//   const TitleScreen({Key? key, required this.goToMainScreenUsecase})
//       : super(key: key);

//   @override
//   _TitleScreenState createState() => _TitleScreenState();
// }

// class _TitleScreenState extends State<TitleScreen> {
//   int _selectedIndex = 0;

//   void _onTabSelected(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Title Screen'),
//       ),
//       body: IndexedStack(
//         index: _selectedIndex,
//         children: [
//           Provider<PokemonRepository>(
//             create: (_) => PokemonRepository(),
//             child: Consumer<PokemonRepository>(
//               builder: (context, pokemonRepository, child) =>
//                   PokedexScreen(pokemonRepository: pokemonRepository),
//             ),
//           ),
//           const SettingPage(),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onTabSelected,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }