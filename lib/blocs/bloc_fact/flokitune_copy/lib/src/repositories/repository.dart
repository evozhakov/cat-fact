import 'dart:async';
import 'package:flokitune/src/blocs/bloc_navigation/navigation_bloc.dart';
import 'package:flokitune/src/blocs/bloc_service/service_bloc.dart';
import 'package:flokitune/src/models/song/song_model.dart';
import 'package:flokitune/src/theme_styles/app_themedata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin Repository {
  void saveNewSong(
    BuildContext context,
    Function functionClaer,
    // SongModel newSong,
  ) {
    // temporaryListMySong.add(newSong);
    functionClaer();
    BlocProvider.of<ServiceBloc>(context).add(
      ResetEvent(),
    );
    BlocProvider.of<NavigationBloc>(context).add(NavigationNewPageEvent(
      page: Pages.myStudio,
    ));
  }

  Future<void> datePicker(context, ServiceState state) async {
    DateTime now = DateTime.now();
    DateTime firstDate = now.add(
      const Duration(
        days: -1,
      ),
    );
    DateTime lastDate = now.add(
      const Duration(
        days: 30,
      ),
    );
    await showRoundedDatePicker(
      height: 310.h,
      theme: AppThemeData().calendarTheme(),
      context: context,
      initialDate: state.date ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
    ).then(
      (value) => BlocProvider.of<ServiceBloc>(context).add(
        ChangeDateEvent(
          date: value ?? state.date ?? now,
        ),
      ),
    );
  } // now this datepicker have limited 30 days
}
