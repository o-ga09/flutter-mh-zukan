import 'package:flutter/cupertino.dart';
import 'package:mhzukan/infrastructure/datastore/api.dart';
import '../../domain/entities/pokemon.dart';

class PokemonsNotifier extends ChangeNotifier {
  final Map<int, Pokemon?> _pokeMap = {};

  Map<int, Pokemon?> get pokes => _pokeMap;

  void addPoke(Pokemon poke) {
    _pokeMap[poke.id] = poke;
    notifyListeners();
  }

  void fetchPoke(int id) async {
    _pokeMap[id] = null;
    addPoke((await fetchPokemons(id)) as Pokemon);
  }

  Pokemon? byId(int id) {
    if (!_pokeMap.containsKey(id)) {
      fetchPoke(id);
    }
    return _pokeMap[id];
  }
}