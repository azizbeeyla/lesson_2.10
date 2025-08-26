import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData dark = ThemeData(

    primaryColor: Colors.black,
      brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black,);
}
