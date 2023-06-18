import 'package:flutter/material.dart';
import 'package:mhzukan/presentation/pages/title.dart';
import 'package:provider/provider.dart';
import 'data/repository/pokemon.dart';
import 'domain/entities/theme_mode_notifier.dart';
import 'domain/usecases/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModeNotifier>(
          create: (context) => ThemeModeNotifier(),  // テーマモードの通知を提供する
        ),
        Provider<PokemonRepository>(
          create: (_) => PokemonRepository(),
        ),
      ],
      child: Consumer<ThemeModeNotifier>(
        builder: (context, mode, child) => MaterialApp(
          title: 'Your App',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode.mode,  // テーマモードを取得して設定
          home: child,  // child を指定
        ),
        child: TitleScreen(
          goToMainScreenUsecase: GoToMainScreenUsecase(),
        ),
      ),
    );
  }
}