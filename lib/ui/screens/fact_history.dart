import 'dart:developer';

import 'package:cats_fact/repository/history_repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FactHistory extends StatelessWidget {
  const FactHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!;
    final historyRepository = HistoryRepository();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          text.titleHistory,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: StreamBuilder(
          stream: historyRepository.facts(),
          builder: (context, facts) {
            final savedHistory = facts.data ?? [];
            return ListView.builder(
              itemCount: savedHistory.length,
              itemBuilder: (context, index) {
                final history = savedHistory[index];
                return Dismissible(
                  onDismissed: (dir) =>
                      historyRepository.removeFact(history, text),
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
