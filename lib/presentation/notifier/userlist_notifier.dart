// ユースケースを呼び出して画面に通知する
// list.dartから呼び出される

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/usecases/getPokemon_usecase.dart';
import '../state/user_state.dart';

// final userListNotifierProvider =
//     StateNotifierProvider<UserListNotifier, AsyncValue<List<UserState>>>(
//   (ref) => UserListNotifier(
//     getUsersUsecase: ref.read(getUsersUsecaseProvider),
//   ),
// );

// class UserListNotifier extends StateNotifier<AsyncValue<List<UserState>>> {
//   UserListNotifier({required GetUsersUsecase getUsersUsecase})
//       : _getUsersUsecase = getUsersUsecase,
//         super(const AsyncLoading()) {
//     _fetch();
//   }

//   final GetUsersUsecase _getUsersUsecase;

//   /// ユーザー一覧の同期
//   Future<void> _fetch() async {
//     state = await AsyncValue.guard(() async {
//       final res = await _getUsersUsecase.execute();
//       return res.map((e) => UserState.fromEntity(e)).toList();
//     });
//   }
// }

final userListNotifierProvider =
    StateNotifierProvider<UserListNotifier, AsyncValue<List<UserState>>>(
  (ref) => UserListNotifier(
    getUsersUsecase: ref.read(getUsersUsecaseProvider),
  ),
);

class UserListNotifier extends StateNotifier<AsyncValue<List<UserState>>> {
  UserListNotifier({required GetUsersUsecase getUsersUsecase})
      : _getUsersUsecase = getUsersUsecase,
        super(const AsyncLoading()) {
    _fetch();
  }

  final GetUsersUsecase _getUsersUsecase;

  /// ユーザー一覧の同期
  Future<void> _fetch() async {
    state = await AsyncValue.guard(() async {
      final res = await _getUsersUsecase.execute();
      return res.map((e) => UserState.fromEntity(e)).toList();
    });
  }
}