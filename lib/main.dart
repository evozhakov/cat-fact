import 'package:cats_fact/models/history/box_history.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'presentation/main_fact_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

late Box box;
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SavedHistoryAdapter());
  box = await Hive.openBox<SavedHistory>('history');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: CatFacts(),
    );
  }
}
