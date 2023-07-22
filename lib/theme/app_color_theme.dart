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
        accentColor: Color(0x27A2BB),
        gray100: Color(0x404040),
        gray200: Color(0x616161),
        gray300: Color(0xD9D9D9),
        gray400: Color(0xF0F0F0),
      );
}
