import 'package:flutter/cupertino.dart';

class LoggerUtil {
  LoggerUtil._();
  
  /// コンソール上にログを表示する 
  static void log(String message) {
    debugPrint('[Logger] $message');
  }
}