import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/constants/app_strings.dart';
import 'package:flokitune/src/ui/login/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountPageBody extends StatelessWidget {
  final AppLocalizations localizations;
  const AccountPageBody({
    super.key,
    required this.localizations,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.amber,
              radius: 26.76.r,
            ),
            20.horizontalSpace,
            SizedBox(
              height: 46.31.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localizations.welcome,
                    style:
                        temporaryStyle(const Color.fromRGBO(150, 154, 160, 1)),
                  ),
                  7.72.verticalSpace,
                  Text(
                    'Subodh',
                    style: temporaryStyle(),
                  ),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              child: _icon(
                AppAssets.login,
              ),
            ),
          ],
        ),
        26.verticalSpace,
        Divider(
          thickness: 1.h,
        ),
        30.verticalSpace,
        menuElement(AppAssets.moneys, localizations.earnings),
        40.verticalSpace,
        menuElement(AppAssets.okb, localizations.nft),
        40.verticalSpace,
        menuElement(AppAssets.userSquare, localizations.profile),
        40.verticalSpace,
        menuElement(AppAssets.setting, localizations.settings),
        40.verticalSpace,
        menuElement(AppAssets.question, localizations.support),
        40.verticalSpace,
        SizedBox(
          height: 56.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(44, 46, 59, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _icon(AppAssets.logout),
                12.5.horizontalSpace,
                Text(
                  localizations.logOut,
                  style: temporaryStyle(),
                )
              ],
            ),
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((context) => const Auth()),
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          AppStrings.version,
          style: temporaryStyle(
            const Color.fromRGBO(150, 154, 160, 1),
          ),
        ),
        33.07.verticalSpace,
      ],
    );
  }

  Widget _icon(String image) {
    return SizedBox.square(
      dimension: 24.h,
      child: SvgPicture.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }

  TextStyle temporaryStyle([Color color = Colors.white]) {
    return TextStyle(
      color: color,
      fontFamily: AppAssets.fontPoppisns,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
    );
  }

  Widget menuElement(String image, String localizations) {
    return Padding(
      padding: EdgeInsets.only(left: 2.w, right: 15.6.w),
      child: Row(
        children: [
          _icon(image),
          12.2.horizontalSpace,
          Text(
            localizations,
            style: temporaryStyle(),
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
            size: 17.h,
          ),
        ],
      ),
    );
  }
}
