import 'package:flutter/material.dart';

class AppTheme {
  static get lightTheme => ThemeData.light(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(244, 244, 244, 1),
      typography: Typography());

  static get darkTheme => ThemeData.light();
}
