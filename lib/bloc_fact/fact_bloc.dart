import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_fact/presentation/cat_fact.dart';
import 'package:cats_fact/presentation/swipe_card.dart';

part 'fact_event.dart';

class FactBloc extends Bloc<FactEvent, List<SwipeCard>> {
  AppinioSwiperController controller;
  BuildContext context;
  FactBloc(this.controller, this.context) : super([]) {
    on<FirstEvent>(
      (FirstEvent event, Emitter<List<SwipeCard>> emit) async {
        await factRepository.emitCard(
          context: context,
          emit: emit,
          isFirs: true,
        );
      },
    );
    on<MoreEvent>(
      (MoreEvent event, Emitter<List<SwipeCard>> emit) async {
        factRepository.cards.clear();
        factRepository.catFacts.clear();
        emit([]);
        await factRepository.emitCard(
          context: context,
          emit: emit,
          isFirs: false,
        );
      },
    );
  }
}
