import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:cats_fact/models/fact_model.dart';
import 'package:cats_fact/presentation/card_fact/cat_fact.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc()
      : super(
          const SaveState(),
        ) {
    on<SaveEvent>(
      (
        SaveEvent event,
        Emitter<SaveState> emit,
      ) {
        cardRrepository.event(
          emit: emit,
          event: event,
        );
      },
    );
  }
}
