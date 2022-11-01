import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/constants/app_strings.dart';

class RichTextWelcome extends StatelessWidget {
  final String welcomeTo;
  const RichTextWelcome({
    super.key,
    required this.welcomeTo,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.h,
      width: 265.w,
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 32.sp,
            fontFamily: AppAssets.fontJakarta,
            fontWeight: FontWeight.w800,
          ),
          text: welcomeTo,
          children: const [
            TextSpan(
              text: AppStrings.floki,
            ),
          ],
        ),
      ),
    );
  }
}
