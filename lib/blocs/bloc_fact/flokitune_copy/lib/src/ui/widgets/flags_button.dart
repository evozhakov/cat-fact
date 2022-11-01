import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlagsButton extends StatelessWidget with AuthRepository {
  final AuthState state;
  FlagsButton({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        10.verticalSpace,
        InkWell(
          onTap: () => showCountries(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                state.getFlagImagePath,
                package: 'intl_phone_field',
                width: 32,
                height: 20,
                fit: BoxFit.fill,
              ),
              const SizedBox(width: 8),
              FittedBox(
                child: Text(
                  '+${state.country.dialCode}',
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 16.sp,
                    fontFamily: AppAssets.fontJakarta,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
        16.verticalSpace,
      ],
    );
  }
}
