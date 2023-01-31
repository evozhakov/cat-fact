import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/models/history/box_history.dart';
import 'package:cats_fact/constants/app_theme.dart';
import 'package:cats_fact/ui/screens/cat_fact.dart';
import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';
import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';
import 'package:cats_fact/models/settings/settings_model.dart';
import 'package:cats_fact/utils/utils.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SavedHistoryAdapter());
  Hive.registerAdapter(SettingsModelAdapter());

  await Hive.openBox<SavedHistory>('history');
  final boxSettingsValue = await Hive.openBox<SettingsModel>('settings');

  final settings = boxSettingsValue.values.isNotEmpty
      ? boxSettingsValue.values.first
      : const SettingsModel();

  runApp(CatFact(settings));
}

class CatFact extends StatelessWidget {
  final SettingsModel settings;
  const CatFact(this.settings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ServiceBloc>(
      create: (context) => ServiceBloc(settings),
      child: MaterialApp(
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
      ),
    );
  }
}
