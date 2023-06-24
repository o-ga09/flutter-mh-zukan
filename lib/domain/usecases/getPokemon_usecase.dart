import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/usecase/getPokemon_usecase_impl.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemon.dart';


final getPokemonUsecaseProvider = Provider<GetPokemonUsecase>(
  (ref) => GetPokemonUsecaseImpl(
    pokemonRepository: ref.watch(pokemonRepositoryProvider),
  ),
);

abstract class GetPokemonUsecase {
  Future<Pokemon> execute(int id);
}