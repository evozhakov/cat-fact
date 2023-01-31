import 'package:cats_fact/ui/widgets/card_fact/icon_save_fact.dart';
import 'package:flutter/material.dart';

import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/repository/repository_imports.dart';

class RandomImageWidget extends StatelessWidget {
  final FactModel catFact;
  const RandomImageWidget({
    super.key,
    required this.catFact,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 2.5;
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Stack(
          fit: StackFit.expand,
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
            IconSaveFact(catFact),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                color: const Color.fromARGB(151, 97, 97, 97),
                height: 40,
                width: 40,
                child: InkWell(
                  onTap: () => cardRrepository.shareFact(catFact),
                  child: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
