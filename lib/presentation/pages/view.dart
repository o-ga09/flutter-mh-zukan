// 画面を定義する
// main.dartから呼び出される

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: UserList(),
      ),
    );
  }
}

