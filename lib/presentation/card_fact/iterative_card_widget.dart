import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/presentation/card_fact/random_image_widget.dart';
import 'package:cats_fact/constants/app_colors.dart';
import 'package:cats_fact/models/fact_model.dart';

class IterativeCard extends StatelessWidget {
  final FactModel catFact;
  const IterativeCard({
    super.key,
    required this.catFact,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RandomImageWidget(
          catFact: catFact,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          AppLocalizations.of(context)!.fact,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Text(
          catFact.date,
          style: const TextStyle(
            color: AppColors.color3,
          ),
        ),
        Expanded(
          flex: 1,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              catFact.fact,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 19,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
