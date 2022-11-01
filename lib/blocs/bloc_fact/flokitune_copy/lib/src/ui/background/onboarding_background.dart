import 'package:flokitune/src/constants/app_assets.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 222.89.h),
      child: SizedBox.expand(
        child: SvgPicture.asset(
          AppAssets.elementsOnboardingfull,
          height: 589.11.h,
          width: 375.w,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
