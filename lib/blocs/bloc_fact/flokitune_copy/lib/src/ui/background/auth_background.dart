import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthBackground extends StatelessWidget {
  final AuthState state;
  const AuthBackground({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return state.isSignIn
        ? SvgPicture.asset(
            AppAssets.logoElements,
            fit: BoxFit.fitWidth,
            width: 375.w,
          )
        : SvgPicture.asset(
            AppAssets.elements,
            fit: BoxFit.fill,
          );
  }
}
