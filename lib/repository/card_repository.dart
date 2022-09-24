import 'dart:developer';
import 'package:cats_fact/presentation/swipe_card.dart';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:cats_fact/constants/app_strings.dart';
import 'package:cats_fact/models/fact/get_fact_model.dart';
import 'package:cats_fact/presentation/cat_fact.dart';

class CardRepository {
  void swipe(
    int index,
    AppinioSwiperDirection direction,
  ) {
    log(
      AppStrings.swiped + direction.name,
    );
  }

  void unswipe(
    bool unswiped,
  ) {
    if (unswiped) {
      log(
        AppStrings.success,
      );
    } else {
      log(
        AppStrings.fail,
      );
    }
  }

  Future<void> loadCards() async {
    for (CardModel catFact in factRepository.catFacts) {
      factRepository.cards.add(
        SwipeCard(
          catFact: catFact,
        ),
      );
    }
  }
}

