import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/repository/repository_imports.dart';
import 'package:cats_fact/models/settings/settings_item_model.dart';
import 'package:cats_fact/ui/widgets/settings/count_fact_dropdown.dart';
import 'package:cats_fact/ui/widgets/settings/settings_items.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!;

    final factSettings = [
      SettingsItemModel(
        title: text.numberCards,
        trailing: const CountFactWidget(),
      ),
      SettingsItemModel(
        onTap: () => hiveFactRepository.clearBox(text),
        title: text.clear,
        icon: Icons.clear,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          text.settings,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _title(text.facts),
            SettingsItems(factSettings),
          ],
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
