import 'package:flutter/material.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_fact/presentation/card_fact/cat_fact.dart';
import 'package:cats_fact/presentation/card_fact/swipe_card.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  AppinioSwiperController controller;
  BuildContext context;

  FactBloc(this.controller, this.context)
      : super(
          const FactState(),
        ) {
    on<FirstLoadEvent>(
      (
        FirstLoadEvent event,
        Emitter<FactState> emit,
      ) async {
        await factRepository.emitCards(
          context: context,
          emit: emit,
          isFirs: true,
        );
      },
    );

    on<MoreLoadEvent>(
      (
        MoreLoadEvent event,
        Emitter<FactState> emit,
      ) async {
        factRepository.cards.clear();
        factRepository.catFacts.clear();
        emit(
          const FactState(),
        );
        await factRepository.emitCards(
          context: context,
          emit: emit,
          isFirs: false,
        );
      },
    );
  }
}
