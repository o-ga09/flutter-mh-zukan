import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../infrastructure/factory/pokemonFactoryImpl.dart';
import '../entities/pokemon.dart';
import '../../infrastructure/datastore/model.dart';

final pokemonFactoryProvider =
    Provider<PokemonFactory>(
  (ref) => PokemonFactoryImpl(),
);

abstract class PokemonFactory {
  Pokemon create({
    required int id,
    required String name,
    required String imgUrl,
    required List<String> types,
  });

  Pokemon createFromModel(Data data);
}