// UIのコンポーネント
// 画面を定義するクラスから呼び出される

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../notifier/userlist_notifier.dart';
import 'listItem.dart';

// class PokeList extends StatefulWidget {
//   const PokeList({Key? key}) : super(key: key);
//   @override
//   _PokeListState createState() => _PokeListState();
// }

// class _PokeListState extends State<PokeList> {
//   static const int more = 30;
//   int pokeCount = more;
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PokemonsNotifier>(
//       builder: (context, pokes, child) => ListView.builder(
//         padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
//         itemCount: pokeCount + 1, // pokeMaxId,
//         itemBuilder: (context, index) {
//           if (index == pokeCount) {
//             return OutlinedButton(
//               child: const Text('more'),
//               onPressed: () => {
//                 setState(
//                   () {
//                     pokeCount = pokeCount + more;
//                     if (pokeCount > MaxId) {
//                       pokeCount = MaxId;
//                     }
//                   },
//                 )
//               },
//             );
//           } else {
//             return PokeListItem(
//               poke: pokes.byId(index + 1),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

class UserList extends ConsumerWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userListNotifierProvider);
    return state.when(
      data: (users) {
        return ListView(
          children: users
              .map(
                (e) => UserListItem(
                    birthday: e.birthday,
                    name: e.name,
                    thumbnailLink: e.thumbnailLink),
              )
              .toList(),
        );
      },
      error: (error, _) {
        return Center(
          child: Text(
            error.toString(),
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}