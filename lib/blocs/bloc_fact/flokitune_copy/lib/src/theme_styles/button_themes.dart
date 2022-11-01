import 'package:flokitune/src/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonTheme {
  static ButtonStyle loginWith = ElevatedButton.styleFrom(
    backgroundColor: AppColors.color2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
      side: const BorderSide(
        color: AppColors.color3,
      ),
    ),
  );

  static ButtonStyle sign = ElevatedButton.styleFrom(
    backgroundColor: AppColors.color1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.r),
    ),
  );
}
