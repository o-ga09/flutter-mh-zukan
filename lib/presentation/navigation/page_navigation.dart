// ページ遷移をするコンポーネント
// xxxから呼び出される

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageNavigation {
  static Future push(BuildContext context, Widget page) async {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ),
    );
  }
}