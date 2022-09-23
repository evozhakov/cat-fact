import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_fact/presentation/cat_fact.dart';
import 'package:cats_fact/presentation/swipe_card.dart';

part 'fact_event.dart';

class FactBloc extends Bloc<FactEvent, List<SwipeCard>> {
  FactBloc(
    AppinioSwiperController controler,
    BuildContext context,
  ) : super([]) {
    on(
      (event, emit) async {
        factRepository.cards.clear();
        factRepository.catFacts.clear();
        emit([]);

        await factRepository
            .addCards(context)
            .whenComplete(
              () => factRepository.loadCards(),
            )
            .whenComplete(
              () => emit(factRepository.cards),
            )
            .whenComplete(
              () => controler.swipe(),
            );
      },
    );
  }
}
