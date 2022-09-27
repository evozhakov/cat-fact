import 'package:cats_fact/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeDataLite = ThemeData(
    brightness: Brightness.light,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.color1,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.colorNull,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.color1,
        fontSize: 20,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.color1,
      ),
    ),
  );
}
