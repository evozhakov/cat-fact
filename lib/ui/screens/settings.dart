import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';
import 'package:cats_fact/constants/app_strings.dart';
import 'package:cats_fact/repository/history_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final historyRepository = HistoryRepository();

    final factSettings = [
      SettingsItemModel(
        title: text.numberCards,
        trailing: const CountFactWidget(),
      ),
      SettingsItemModel(
        onTap: () => historyRepository.clearBox(text),
        title: text.clear,
        icon: Icons.clear,
      ),
    ];
    final languageSettings = [
      const SettingsItemModel(
        title: 'language',
        trailing: LanguageDropDown(),
      ) //to local
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
            SettingsItems(factSettings),
            SettingsItems(languageSettings),
          ],
        ),
      ),
    );
  }
}

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.select((ServiceBloc bloc) => bloc.state.locale);
    return DropdownButton(
      value: locale,
      onChanged: (value) => settingsRepository.changeLanguage(context, value!),
      items: AppStrings.localeList
          .map(
            (e) => DropdownMenuItem<String>(
              value: e.languageCode,
              child: Text(
                e.languageName,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
