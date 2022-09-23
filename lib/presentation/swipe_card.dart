import 'package:flutter/material.dart';

import 'package:cats_fact/constants/app_colors.dart';
import 'package:cats_fact/constants/app_strings.dart';
import 'package:cats_fact/models/fact/get_fact_model.dart';
import 'package:cats_fact/presentation/first_card_widget.dart';
import 'package:cats_fact/presentation/iterative_card_widget.dart';

class SwipeCard extends StatelessWidget {
  final CardModel catFact;

  const SwipeCard({
    required this.catFact,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.color2,
        boxShadow: const [
          BoxShadow(
            color: AppColors.color3,
            blurRadius: 7,
          )
        ],
      ),
      alignment: Alignment.center,
      child: catFact.fact == AppStrings.empty
          ? const FirstCard()
          : IterativeCard(
              catFact: catFact,
            ),
    );
  }
}
