import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle style1 = TextStyle(
    color: const Color.fromRGBO(150, 155, 160, 1),
    fontSize: 13.sp,
  );
  static TextStyle uploadFile = TextStyle(
    fontFamily: AppAssets.fontJakarta,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle supportStor = TextStyle(
    color: const Color.fromRGBO(150, 154, 160, 1),
    fontFamily: AppAssets.fontPoppisns,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
  );
}
