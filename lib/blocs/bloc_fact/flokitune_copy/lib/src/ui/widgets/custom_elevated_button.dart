import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/theme_styles/button_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: 327.w,
      child: ElevatedButton(
        style: CustomButtonTheme.sign,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: AppAssets.fontJakarta,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () => onTap(),
      ),
    );
  }
}
