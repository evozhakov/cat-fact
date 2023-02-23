import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:cats_fact/models/history/box_history.dart';
import 'package:cats_fact/models/settings/settings_model.dart';
import 'package:cats_fact/ui/wrap_app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SavedHistoryAdapter());
  Hive.registerAdapter(SettingsModelAdapter());

  await Hive.openBox<SavedHistory>('history');
  final boxSettingsValue = await Hive.openBox<SettingsModel>('settings');

  final settings = boxSettingsValue.values.isNotEmpty
      ? boxSettingsValue.values.first
      : const SettingsModel();

  runApp(WrapApp(settings));
}
