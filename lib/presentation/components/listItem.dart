// UIのコンポーネント
// リストに表示する各要素

import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    Key? key,
    required this.birthday,
    required this.name,
    required this.thumbnailLink,
  }) : super(key: key);

  final String name;
  final String thumbnailLink;
  final String birthday;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(backgroundImage: NetworkImage(thumbnailLink)),
    );
  }
}
// import 'package:flutter/material.dart';
// import '../pages/main.dart';
// import '../../core/utils/const.dart';
// import '../../domain/entities/pokemon.dart';

// class PokeListItem extends StatelessWidget {
//   const PokeListItem({Key? key, required this.poke}) : super(key: key);
//   final Pokemon? poke;
//   @override
//   Widget build(BuildContext context) {
//     if (poke != null) {
//       return ListTile(
//         leading: Container(
//           width: 80,
//           decoration: BoxDecoration(
//             color: (pokeTypeColors[poke!.types.first] ?? Colors.grey[100])
//                 ?.withOpacity(.3),
//             borderRadius: BorderRadius.circular(10),
//             image: DecorationImage(
//               fit: BoxFit.fitWidth,
//               image: NetworkImage(
//                 poke!.imageUrl,
//               ),
//             ),
//           ),
//         ),
//         title: Text(
//           poke!.name,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(poke!.types.first),
//         trailing: const Icon(Icons.navigate_next),
//         onTap: () => {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (BuildContext context) => const MainScreen(),
//             ),
//           ),
//         },
//       );
//     } else {
//       return const ListTile(title: Text('...'));
//     }
//   }
// }