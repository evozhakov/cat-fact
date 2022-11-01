import 'package:flokitune/src/blocs/bloc_service/service_bloc.dart';
import 'package:flokitune/src/ui/widgets/calendar_button.dart';
import 'package:flokitune/src/ui/widgets/custom_elevated_button.dart';
import 'package:flokitune/src/ui/widgets/custom_form.dart';
import 'package:flokitune/src/ui/widgets/switch_buton.dart';
import 'package:flokitune/src/ui/widgets/upload_file_widget.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/bloc_navigation/navigation_bloc.dart';
import '../../constants/app_assets.dart';

class NewSongBody extends StatelessWidget {
  final TextEditingController genreController;
  final TextEditingController nameController;
  final ServiceState state;
  const NewSongBody({
    super.key,
    required this.state,
    required this.genreController,
    required this.nameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UploadFileWidget(
          function: () {},
          localizations: state.localizations,
        ),
        32.verticalSpace,
        CustomTextField(
          controller: nameController,
          fieldName: state.localizations.songName,
        ),
        20.verticalSpace,
        CustomTextField(
          controller: genreController,
          fieldName: state.localizations.genre,
        ),
        20.verticalSpace,
        Text(
          state.localizations.keyword,
          style: _temporary(),
        ),
        50.verticalSpace,
        Divider(
          thickness: 1.h,
        ),
        20.verticalSpace,
        Text(
          state.localizations.release,
          style: _temporary(),
        ),
        10.verticalSpace,
        CalendarButton(
          state: state,
        ),
        16.verticalSpace,
        Divider(
          thickness: 1.h,
        ),
        22.71.verticalSpace,
        SwitchButton(
          text: state.localizations.mint,
          state: state.switchValueMint,
        ),
        44.27.verticalSpace,
        CustomElevatedButton(
          text: state.localizations.next,
          onTap: () => BlocProvider.of<NavigationBloc>(context).add(
            NavigationNewPageEvent(page: Pages.myBestSongs),
          ),
        ),
        50.verticalSpace,
      ],
    );
  }

  TextStyle _temporary() {
    return TextStyle(
      color: const Color.fromRGBO(150, 156, 160, 1),
      fontSize: 13.sp,
      fontFamily: AppAssets.fontPoppisns,
      fontWeight: FontWeight.w500,
    );
  }
}
