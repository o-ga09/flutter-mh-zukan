// main.dart
// 責務：アプリのエントリーポイント

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mhzukan/presentation/pages/view.dart';

// アプリのエントリーポイント
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

// アプリのメインクラス
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}