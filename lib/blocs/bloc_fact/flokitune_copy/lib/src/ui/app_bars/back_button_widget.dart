import 'dart:developer';

import 'package:flokitune/src/blocs/bloc_navigation/navigation_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/ui/general_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarBackButtonWidget extends StatelessWidget {
  final String title;
  final bool showPopupMenu;
  final bool otherFunk;

  const AppBarBackButtonWidget({
    super.key,
    this.otherFunk = false,
    required this.title,
    this.showPopupMenu = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => !otherFunk
              ? BlocProvider.of<NavigationBloc>(context).add(
                  NavigationPeviousPageEvent(),
                )
              : panelController.close(),
          child: SizedBox.square(
            dimension: 24.w,
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            fontFamily: AppAssets.fontJakarta,
          ),
        ),
        showPopupMenu
            ? SizedBox(
                width: 24.w,
                child: SvgPicture.asset(
                  AppAssets.threeDots,
                  fit: BoxFit.fitWidth,
                ),
              )
            : 24.horizontalSpace,
      ],
    );
  }
}
