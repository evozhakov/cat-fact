import 'package:cats_fact/repository/repository_imports.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/models/history/box_history.dart';
import 'package:cats_fact/constants/app_theme.dart';
import 'package:cats_fact/presentation/card_fact/cat_fact.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(
    SavedHistoryAdapter(),
  );
  await Hive.openBox<SavedHistory>(
    HiveBox.history.toString(),
  );

  runApp(const CatFact());
}

class CatFact extends StatelessWidget {
  const CatFact({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeDataLite,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CatFacts(),
    );
  }
}
