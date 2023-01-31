import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/repository/repository_imports.dart';
import 'package:cats_fact/models/history/box_history.dart';

class IconSaveFact extends StatelessWidget {
  final FactModel catFact;
  const IconSaveFact(this.catFact, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ValueListenableBuilder<Box<SavedHistory>>(
        valueListenable: hiveFactRepository.boxHistory,
        builder: (context, box, widget) {
          final isContains = box.values.any((e) => e.id.contains(catFact.id));
          return IconButton(
            onPressed: () =>
                hiveFactRepository.onTapIconSave(catFact, isContains),
            icon: FaIcon(
              isContains
                  ? FontAwesomeIcons.heartCrack
                  : FontAwesomeIcons.solidHeart,
              color: Colors.red,
              size: 30,
            ),
          );
        },
      ),
    );
  }
}