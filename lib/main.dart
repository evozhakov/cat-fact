import 'package:cats_fact/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:cats_fact/models/settings/settings_model.dart';
import 'package:cats_fact/ui/wrap_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  Hive.registerAdapter(SettingsModelAdapter());
  final boxSettingsValue = await Hive.openBox<SettingsModel>('settings');

  final settings = boxSettingsValue.values.isNotEmpty
      ? boxSettingsValue.values.first
      : const SettingsModel();

  runApp(WrapApp(settings));
}
