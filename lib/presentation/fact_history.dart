import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/constants/app_colors.dart';
import 'package:cats_fact/repository/repository_imports.dart';
import 'package:cats_fact/models/history/box_history.dart';

class FactHistory extends StatelessWidget {
  const FactHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<SavedHistory> history = hiveRepository.history();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          AppLocalizations.of(context)!.titleHistory,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: ((context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      history[index].date,
                      style: const TextStyle(
                        color: AppColors.color3,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      history[index].fact,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
