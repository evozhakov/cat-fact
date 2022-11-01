import 'package:flokitune/src/blocs/bloc_service/service_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/repositories/repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarButton extends StatelessWidget with Repository {
  final ServiceState state;
  const CalendarButton({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          state.dateInFormat,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: AppAssets.fontJakarta,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox.square(
          dimension: 24.h,
          child: InkWell(
            onTap: () => datePicker(context, state),
            child: SvgPicture.asset(
              AppAssets.calendar,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
