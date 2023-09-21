import 'package:flutter/material.dart';

// FIXME: 後で整備する
class AppColorTheme {
  const AppColorTheme({
    required this.mainColor,
    required this.accentColor,
    required this.gray100,
    required this.gray200,
    required this.gray300,
    required this.gray400,
  });

  final Color mainColor;
  final Color accentColor;
  final Color gray100;
  final Color gray200;
  final Color gray300;
  final Color gray400;

  factory AppColorTheme.dark() => AppColorTheme(
        mainColor: Color(0xffffb700),
        accentColor: Color.fromARGB(255, 39, 162, 187),
        gray100: Color.fromARGB(255, 64, 64, 64),
        gray200: Color.fromARGB(255, 97, 97, 97),
        gray300: Color.fromARGB(255, 217, 217, 217),
        gray400: Color.fromARGB(255, 240, 240, 240),
      );
}
