import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../domain/entities/pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      final List<Pokemon> pokemons = [];

      for (var i = 0; i < data.length; i++) {
        final pokemonData = data[i];
        final pokemonId = i + 1;
        final pokemonImageUrl =
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokemonId.png';
        final pokemonName = pokemonData['name'];
        final pokemonTypes = await fetchPokemonTypes(pokemonData['url']);

        final pokemon = Pokemon(
          id: pokemonId,
          name: pokemonName,
          imageUrl: pokemonImageUrl,
          types: pokemonTypes,
        );

        pokemons.add(pokemon);
      }

      return pokemons;
    } else {
      throw Exception('Failed to fetch pokemons');
    }
  }

  Future<List<String>> fetchPokemonTypes(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['types'];
      final List<String> types = [];

      for (var i = 0; i < data.length; i++) {
        final typeData = data[i];
        final typeName = typeData['type']['name'];
        types.add(typeName);
      }

      return types;
    } else {
      throw Exception('Failed to fetch pokemon types');
    }
  }

  Future<void> cachePokemonList(List<Pokemon> pokemonList) async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'pokemon_cache.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pokemon(id INTEGER PRIMARY KEY, name TEXT, imageUrl TEXT)',
        );
      },
      version: 1,
    );

    await database.transaction((txn) async {
      await txn.delete('pokemon'); // 既存のデータを削除

      for (var pokemon in pokemonList) {
        await txn.insert(
          'pokemon',
          {'id': pokemon.id, 'name': pokemon.name, 'imageUrl': pokemon.imageUrl},
        );
      }
    });
  }

  Future<List<Pokemon>> getCachedPokemonList() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'pokemon_cache.db'),
      version: 1,
    );

    final List<Map<String, dynamic>> maps = await database.query('pokemon');

    return List.generate(maps.length, (index) {
      return Pokemon(
        id: maps[index]['id'],
        name: maps[index]['name'],
        imageUrl: maps[index]['imageUrl'], types: [],
      );
    });
  }
}