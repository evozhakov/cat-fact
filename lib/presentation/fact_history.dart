import 'package:cats_fact/models/history/box_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';

class ModalInsideModal extends StatefulWidget {
  const ModalInsideModal({super.key});

  @override
  State<ModalInsideModal> createState() => _ModalInsideModalState();
}

class _ModalInsideModalState extends State<ModalInsideModal> {
  dynamic boxHistory = Hive.box<SavedHistory>('history');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Text(
                AppLocalizations.of(context)!.titleHistory,
                style: const TextStyle(fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // change ...end
                children: [
                  IconButton(   // delete this button
                    onPressed: () => boxHistory.clear(),
                    icon: const Icon(
                      Icons.delete_outline,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Divider(),
          Expanded(
              child: ListView.builder(
            itemCount: boxHistory.length,
            itemBuilder: ((context, index) {
              List<SavedHistory> history = boxHistory.values.toList();

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        history[index].date,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        history[index].fact,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              );
            }),
          ))
        ],
      ),
    );
  }
}
