import 'package:flokitune/src/blocs/bloc_navigation/navigation_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SeartAppBarWidget extends StatelessWidget {
  final Pages page;
  final bool addLeadingIcon;
  final String title;
  const SeartAppBarWidget({
    super.key,
    this.addLeadingIcon = true,
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        addLeadingIcon
            ? SizedBox.square(
                dimension: 24.h,
                child: InkWell(
                  onTap: () => BlocProvider.of<NavigationBloc>(context).add(
                    NavigationNewPageEvent(page: page),
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24.h,
                  ),
                ),
              )
            : 24.horizontalSpace,
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
            fontFamily: AppAssets.fontJakarta,
          ),
        ),
        SizedBox(
          width: 24.w,
          child: SvgPicture.asset(
            AppAssets.search,
            fit: BoxFit.fitWidth,
          ),
        )
      ],
    );
  }
}
