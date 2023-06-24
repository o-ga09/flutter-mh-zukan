import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemon.dart';
import '../../domain/usecases/getPokemon_usecase.dart';

class GetPokemonUsecaseImpl implements GetPokemonUsecase {
  final PokemonRepository _pokemonRepository;

  GetPokemonUsecaseImpl({
    required PokemonRepository pokemonRepository,
  }) : _pokemonRepository = pokemonRepository;

  @override
  Future<Pokemon> execute(int id) async {
    return await _pokemonRepository.fetch(id);
  }
}