import 'package:flutter/material.dart';

import 'package:cats_fact/constants/app_strings.dart';
import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/ui/widgets/card_fact/first_card_widget.dart';
import 'package:cats_fact/ui/widgets/card_fact/iterative_card_widget.dart';

class SwipeCard extends StatelessWidget {
  final FactModel catFact;

  const SwipeCard({
    required this.catFact,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
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
