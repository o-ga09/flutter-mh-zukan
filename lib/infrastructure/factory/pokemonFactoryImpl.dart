import '../../domain/entities/pokemon.dart';
import '../../domain/factory/Pokemon.dart';
import '../datastore/model.dart';

class PokemonFactoryImpl implements PokemonFactory {
 @override
 Pokemon create({
  required int id,
  required String name,
  required String imgUrl,
  required List<String> types,
 }) {
  return Pokemon(
      id: id,
      name: name, 
      imageUrl: imgUrl,
      types: types
    );
 }

 @override
 Pokemon createFromModel(Data data) {
  return Pokemon(
      id: data.id, 
      name: data.name, 
      imageUrl: data.imgUrl, 
      types: data.types,
    );
 } 
}