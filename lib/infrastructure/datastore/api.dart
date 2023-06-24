import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../core/exceptions/network_exception.dart';
import './model.dart';
import '../../core/utils/const.dart';
import 'package:dio/dio.dart';

final pokemonApiDatasourceProvider =
    Provider<pokemonApiDatasource>(
  (ref) => pokemonApiDatasourceImpl(
    dio: Dio(
      BaseOptions(baseUrl: ApiRoute),
    ),
  ),
);

/// サンプル用
/// https://randomuser.me
abstract class pokemonApiDatasource {
  Future<Data> getPokemon(int id);
}

/// サンプル用
class pokemonApiDatasourceImpl
    implements pokemonApiDatasource {
  final Dio _dio;

  pokemonApiDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<Data> getPokemon(int id) async {
    final res = await _dio.get(
      '/pokemon/$id',
    );
    if (res.statusCode == 200) {
      final body = res.data;
      final data = Data.fromJson(body);
      return data;
    } else {
      throw NetworkException('pokemonApiImpl getUsers() "/"');
    }
  }
}

