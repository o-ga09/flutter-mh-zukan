import 'package:flutter/material.dart';

import '../../presentation/pages/main.dart';

class GoToMainScreenUsecase {
  void execute(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }
}