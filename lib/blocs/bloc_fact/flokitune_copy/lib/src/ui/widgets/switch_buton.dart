import 'package:flokitune/src/blocs/bloc_service/service_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchButton extends StatelessWidget {
  final String text;
  final bool isMint;
  final bool state;
  const SwitchButton({
    super.key,
    required this.text,
    required this.state,
    this.isMint = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            overflow: TextOverflow.fade,
            text,
            style: TextStyle(
              fontFamily: AppAssets.fontJakarta,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(
          height: 28.57.h,
          width: 56.5.w,
          child: CupertinoSwitch(
            activeColor: const Color.fromRGBO(172, 36, 192, 1),
            value: state,
            onChanged: (value) => isMint
                ? BlocProvider.of<ServiceBloc>(context).add(
                    SwithMintEvent(svithValue: value),
                  )
                : BlocProvider.of<ServiceBloc>(context).add(
                    SwithSplitEvent(svithValue: value),
                  ),
          ),
        ),
      ],
    );
  }
}
