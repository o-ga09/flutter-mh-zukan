import 'package:flutter/material.dart';
import 'package:mhzukan/data/repository/pokemon.dart';

import '../../domain/entities/pokemon.dart';

class PokedexScreen extends StatelessWidget {
  final PokemonRepository pokemonRepository;

  const PokedexScreen({super.key, required this.pokemonRepository});

  @override
  Widget build(BuildContext context) {
    // テーブルの初期化


    return FutureBuilder<List<Pokemon>>(
      future: pokemonRepository.getCachedPokemonList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // キャッシュされたポケモンリストを表示
          final pokemonList = snapshot.data!;
          return ListView.builder(
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              final pokemon = pokemonList[index];
              return ListTile(
                title: Text(pokemon.name),
                leading: Image.network(pokemon.imageUrl),
              );
            },
          );
        } else if (snapshot.hasError) {
          // エラーメッセージを表示
          return Text('Error: ${snapshot.error}');
        }
        
        // データがまだ読み込まれていない場合はローディング表示
        return const CircularProgressIndicator();
      },
    );
  }
}