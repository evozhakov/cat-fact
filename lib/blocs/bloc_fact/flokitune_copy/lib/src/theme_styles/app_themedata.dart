import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeData {
  final ThemeData theme = ThemeData();
  static ThemeData customThemeData = ThemeData(
    // dialogTheme: DialogTheme(
    //   backgroundColor: const Color.fromRGBO(8, 18, 37, 1),
    // ),
    unselectedWidgetColor: const Color.fromRGBO(117, 121, 142, 1),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color.fromRGBO(255, 255, 255, 1),
    ),
    inputDecorationTheme: InputDecorationTheme(
      counterStyle: const TextStyle(color: Color.fromRGBO(150, 155, 160, 1)),
      contentPadding: EdgeInsets.only(bottom: 16.h, top: 10.h),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 1.h,
          color: const Color.fromRGBO(44, 46, 59, 1),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          width: 2.h,
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
      ),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(5, 11, 23, 1),
    dividerColor: const Color.fromRGBO(44, 46, 59, 1),
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: const Color.fromRGBO(255, 255, 255, 1),
        fontSize: 16.sp,
        fontFamily: AppAssets.fontJakarta,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: const TextStyle(
        fontFamily: AppAssets.fontPoppisns,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    ),
    appBarTheme: AppBarTheme(
      color: const Color.fromRGBO(0, 0, 0, 0),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: AppAssets.fontJakarta,
        fontWeight: FontWeight.w700,
        fontSize: 18.sp,
        color: const Color.fromRGBO(255, 255, 255, 1),
      ),
    ),
  );
  ThemeData calendarTheme() {
    return theme.copyWith(
      iconTheme: const IconThemeData(
        color: Color.fromRGBO(5, 11, 23, 1),
      ),
      // ignore: deprecated_member_use
      accentColor: const Color.fromRGBO(172, 36, 192, 1),
      textTheme: const TextTheme(
        bodyText2: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.white),
      ),
      disabledColor: Colors.grey,
      primaryColor: const Color.fromRGBO(12, 27, 54, 1),
      dialogBackgroundColor: const Color.fromRGBO(5, 11, 23, 1),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
// need:
//1. checkboxTheme 
//2.DividerTheme 
