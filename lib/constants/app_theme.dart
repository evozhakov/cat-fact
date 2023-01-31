import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeDataLite = ThemeData(
    brightness: Brightness.light,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
  );
}
