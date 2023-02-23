import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/constants/app_theme.dart';
import 'package:cats_fact/ui/screens/cat_fact.dart';
import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';
import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';
import 'package:cats_fact/models/settings/settings_model.dart';
import 'package:cats_fact/utils/utils.dart';

class WrapApp extends StatelessWidget {
  final SettingsModel settings;
  const WrapApp(this.settings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceBloc>(
      create: (context) => ServiceBloc(settings),
      child: BlocSelector<ServiceBloc, ServiceState, Locale>(
        selector: (state) {
          return state.localedFromSubtags;
        },
        builder: (context, locale) {
          return MaterialApp(
            locale: locale,
            scaffoldMessengerKey: messengerKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.themeDataLite,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: BlocProvider<FactBloc>(
              create: (context) => FactBloc(context)
                ..add(
                  FirstLoadEvent(),
                ),
              child: const CatFacts(),
            ),
          );
        },
      ),
    );
  }
}
