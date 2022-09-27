import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/presentation/card_fact/cat_fact.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic text = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          text!.settings,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListTile(
              title: Text(
                text!.fact,
              ),
              subtitle: Text(
                text!.clear,
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.clear,
                ),
                onPressed: () => hiveRepository.clearBox(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
