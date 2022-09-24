import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/constants/app_colors.dart';
import 'package:cats_fact/models/fact/get_fact_model.dart';
import 'package:cats_fact/presentation/cat_fact.dart';

class IterativeCard extends StatelessWidget {
  final CardModel catFact;
  const IterativeCard({
    super.key,
    required this.catFact,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 2.5;
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image.network(
                excludeFromSemantics: true,
                catFact.image,
                fit: BoxFit.cover,
                width: width,
                height: height,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: height,
                    width: width,
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () => hiveRepository.saveFact(catFact),
                icon: const Icon(
                  Icons.save,
                  color: AppColors.color2,
                  size: 30,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          AppLocalizations.of(context)!.fact,
          style: const TextStyle(
            color: AppColors.color1,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            catFact.fact,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 19,
            ),
          ),
        ),
      ],
    );
  }
}
