import 'package:bloc/bloc.dart';
import 'package:flokitune/src/repositories/navigation_repository.dart';
import 'package:flokitune/src/ui/my_studio/my_studio.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState>
    with NavigationRepository {
  NavigationBloc(BuildContext context)
      : super(
          const NavigationState(),
        ) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    on<NavigationNewPageEvent>(
      (event, Emitter<NavigationState> emit) => navigation(
        page: event.page,
        emit: emit,
        localizations: localizations,
        state: state,
      ),
    );
    on<NavigationPeviousPageEvent>(
      (event, Emitter<NavigationState> emit) => navigation(
        page: state.previousPage,
        emit: emit,
        localizations: localizations,
        state: state,
      ),
    );
  }
}
