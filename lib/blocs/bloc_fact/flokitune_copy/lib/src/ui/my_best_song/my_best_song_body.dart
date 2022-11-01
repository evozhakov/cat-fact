import 'package:flokitune/src/blocs/bloc_service/service_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/models/song/song_model.dart';
import 'package:flokitune/src/repositories/repository.dart';
import 'package:flokitune/src/ui/widgets/custom_elevated_button.dart';
import 'package:flokitune/src/ui/widgets/switch_buton.dart';
import 'package:flokitune/src/ui/widgets/upload_file_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBestSongBody extends StatelessWidget with Repository {
  final ServiceState state;
  final Function functionClaer;
  // final SongModel song;
  MyBestSongBody({
    super.key,
    required this.state,
    required this.functionClaer,
    // required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 701.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UploadFileWidget(
            isNewSong: false,
            localizations: state.localizations,
            function: () {},
          ),
          30.verticalSpace,
          SwitchButton(
            text: state.localizations.splitRevenue,
            state: state.switchValueSplit,
            isMint: false,
          ),
          15.46.verticalSpace,
          Divider(
            thickness: 1.h,
          ),
          23.verticalSpace,
          Row(
            children: [
              Container(
                color: const Color.fromRGBO(44, 46, 59, 1),
                height: 21.h,
                width: 21.h,
                child: Transform.scale(
                  scale: 1.2.h,
                  child: Checkbox(
                    side: BorderSide(
                      width: 1.w,
                      color: const Color.fromRGBO(117, 121, 142, 1),
                    ),
                    activeColor: const Color.fromRGBO(172, 36, 192, 1),
                    value: state.iAgree,
                    onChanged: (value) =>
                        BlocProvider.of<ServiceBloc>(context).add(
                      CheckBoxEvent(checkBoxValue: value!),
                    ),
                  ),
                ),
              ),
              15.58.horizontalSpace,
              Text(
                state.localizations.copyright,
                style: TextStyle(
                    fontFamily: AppAssets.fontJakarta,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          const Spacer(),
          CustomElevatedButton(
            text: state.localizations.letsGo,
            onTap: () => saveNewSong(
              context,
              functionClaer,
              // song,
            ),
          ),
          50.verticalSpace,
        ],
      ),
    );
  }
}
