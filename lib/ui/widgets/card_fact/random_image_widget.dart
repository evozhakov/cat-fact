import 'package:cats_fact/ui/widgets/card_fact/icon_save_fact.dart';
import 'package:flutter/material.dart';

import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/repository/repository_imports.dart';

class RandomImageWidget extends StatelessWidget {
  final FactModel? catFact;
  final String? ulr;
  const RandomImageWidget({
    super.key,
    this.catFact,
    this.ulr,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 2.5;
    final isFact = catFact != null;
    final imageUlr = isFact ? catFact!.image : ulr!;
    return SizedBox(
      height: height,
      width: width,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CatImageWidget(imageUlr, isFact),
          if (isFact) IconSaveFact(catFact!),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(151, 97, 97, 97),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                ),
              ),
              height: 40,
              width: 40,
              child: InkWell(
                onTap: () => cardRrepository.shareFact(catFact, ulr),
                child: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatImageWidget extends StatelessWidget {
  final String ulr;
  final bool isFact;
  const CatImageWidget(this.ulr, this.isFact, {super.key});

  @override
  Widget build(BuildContext context) {
    final borderRadius = isFact
        ? const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          )
        : const BorderRadius.all(Radius.circular(15));
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        excludeFromSemantics: true,
        ulr,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator.adaptive(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
