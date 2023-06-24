import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mhzukan/infrastructure/datastore/db.dart';

import '../../infrastructure/datastore/api.dart';
import '../../infrastructure/repository/PokemonRepositoryImpl.dart';
import '../entities/pokemon.dart';
import '../factory/Pokemon.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>(
  (ref) => PokemonRepositoryImpl(
    dbdatasource: ref.watch(dbDatasourceProvider),
    pokemonFactory: ref.watch(pokemonFactoryProvider), 
    apiDatasource: ref.watch(pokemonApiDatasourceProvider),
  ),
);

abstract class PokemonRepository {
  /// APIからデータを取得
  Future<Pokemon> fetch(int id); 
  /// DBへデータを保存
  Future<Pokemon> GetById(int id);
  Future<List<Pokemon>> GetAll();
  Future<void> Insert(List<Pokemon> data);
  Future<void> Delete(int id);
  Future<void> Update(int id, Pokemon data);
}