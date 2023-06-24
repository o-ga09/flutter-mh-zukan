import '../../domain/entities/pokemon.dart';
import '../../domain/factory/Pokemon.dart';
import '../../domain/repositories/pokemon.dart';
import '../datastore/api.dart';
import '../datastore/db.dart';
import '../datastore/model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final DBstoreDatasource _dbdatasource;
  final PokemonFactory _pokemonFactory;
  final pokemonApiDatasource _apiDatasource;

  PokemonRepositoryImpl({

    required DBstoreDatasource dbdatasource,
    required PokemonFactory pokemonFactory,
    required pokemonApiDatasource apiDatasource,
  }) : _dbdatasource = dbdatasource,
      _pokemonFactory = pokemonFactory,
      _apiDatasource = apiDatasource;
  
  // APIからデータを取得
  @override
  Future<Pokemon> fetch(int id) async {
    final res = _apiDatasource.getPokemon(id);
    return Pokemon(
      id: id, 
      name: , 
      imageUrl: imageUrl, 
      types: types
    );
  }
  // DBへデータを保存
  @override
  Future<Pokemon> GetById(int id) async {
    final res = await _dbdatasource.GetById(id);
    return _pokemonFactory.createFromModel(res);
  }

  @override
  Future<List<Pokemon>> GetAll() async {
    List<Pokemon> results = [];
    final res = await _dbdatasource.GetAll();

    for (var r in res) {
      final Pokemon record = _pokemonFactory.createFromModel(r);
      results.add(record);
    }

    return results;
  }

  @override
  Future<void> Insert(List<Pokemon> data) async {
    final List<Data> insertData;
    insertData = List.generate(data.length, (index) {
      return Data(
        id: data[index].id,
        name: data[index].name,
        imgUrl: data[index].imageUrl,
        types: data[index].types,
      );
    });
    _dbdatasource.Insert(insertData);
  }

  Future<void> Delete(int id) async {
    _dbdatasource.Delete(id);
  }

  Future<void> Update(int id, Pokemon data) async {
    final updateData = Data(id: -1, name: data.name, imgUrl: data.imageUrl, types: data.types);
    _dbdatasource.Update(id, updateData);
  }
}