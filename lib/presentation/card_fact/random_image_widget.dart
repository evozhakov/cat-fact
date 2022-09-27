import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cats_fact/blocs/bloc_save/save_bloc.dart';
import 'package:cats_fact/constants/app_colors.dart';
import 'package:cats_fact/models/fact_model.dart';
import 'package:cats_fact/presentation/card_fact/cat_fact.dart';

class RandomImageWidget extends StatelessWidget {
  final CardModel catFact;
  const RandomImageWidget({
    super.key,
    required this.catFact,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 2.5;
    return BlocProvider<SaveBloc>(
      create: (context) => SaveBloc(),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Stack(
          alignment: AlignmentDirectional.bottomEnd,
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
            BlocBuilder<SaveBloc, SaveState>(
              builder: (context, state) {

                cardRrepository.swipeSaveEvent =
                    () => cardRrepository.saveEvent(
                          cardModel: catFact,
                          context: context,
                        );

                return IconButton(
                  onPressed: () => cardRrepository.saveEvent(
                    context: context,
                    cardModel: catFact,
                    isDislike: true,
                    isSave: !state.isSave,
                  ),
                  icon: FaIcon(
                    state.isSave
                        ? FontAwesomeIcons.heartCrack
                        : FontAwesomeIcons.solidHeart,
                    color: AppColors.color4,
                    size: 30,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
