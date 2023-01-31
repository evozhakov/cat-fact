import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/models/history/box_history.dart';
import 'package:cats_fact/repository/repository_imports.dart';

class FactHistory extends StatelessWidget {
  const FactHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          text.titleHistory,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ValueListenableBuilder<Box<SavedHistory>>(
          valueListenable: hiveFactRepository.boxHistory,
          builder: (context, box, widget) {
            final savedHistory = box.values.toList();
            return ListView.builder(
              itemCount: savedHistory.length,
              itemBuilder: (context, index) {
                final history = savedHistory[index];
                return Dismissible(
                  onDismissed: (dir) => hiveFactRepository.removeFact(history, text),
                  key: Key(history.id),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                          history.date,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        subtitle: Text(
                          history.fact,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
