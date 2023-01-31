import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_fact/ui/widgets/card_fact/swipe_card.dart';
import 'package:cats_fact/repository/repository_imports.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  final BuildContext context;

  FactBloc(this.context)
      : super(
          const FactState(),
        ) {
    on<FirstLoadEvent>(
      (
        FirstLoadEvent event,
        Emitter<FactState> emit,
      ) async {
        await factRepository
            .emitCards(
          context: context,
          emit: emit,
          isFirs: true,
        )
            .whenComplete(
          () async {
            for (int i = 1; i <= 2; i++) {
              await factRepository.emitForAnimation(
                emit: emit,
                state: state,
              );
            }
          },
        );
      },
    );

    on<MoreLoadEvent>(
      (
        MoreLoadEvent event,
        Emitter<FactState> emit,
      ) async {
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
