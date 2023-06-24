extension StringExtension on String {

  /// 文字列がメールアドレスであるか判定する
  bool get isEmail {
    return RegExp(r'^.+@[a-zA-Z]+\.[a-zA-Z]+(\.?[a-zA-Z]+)$').hasMatch(this);
  }
}