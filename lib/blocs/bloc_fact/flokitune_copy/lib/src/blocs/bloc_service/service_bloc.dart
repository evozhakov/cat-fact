import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  ServiceBloc(BuildContext context)
      : super(
          ServiceState(
            localizations: AppLocalizations.of(context)!,
          ),
        ) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    on<SwithMintEvent>(
      (event, emit) => emit(
        ServiceState(
            localizations: localizations,
            date: state.date,
            switchValueMint: event.svithValue,
            switchValueSplit: state.switchValueSplit,
            iAgree: state.iAgree),
      ),
    );
    on<SwithSplitEvent>(
      (event, emit) => emit(
        ServiceState(
          localizations: localizations,
          iAgree: state.iAgree,
          date: state.date,
          switchValueMint: state.switchValueMint,
          switchValueSplit: event.svithValue,
        ),
      ),
    );

    on<ChangeDateEvent>(
      (event, emit) => emit(
        ServiceState(
          iAgree: state.iAgree,
          localizations: localizations,
          switchValueSplit: state.switchValueSplit,
          date: event.date,
          switchValueMint: state.switchValueMint,
        ),
      ),
    );
    on<CheckBoxEvent>(
      (event, emit) => emit(
        ServiceState(
          iAgree: event.checkBoxValue,
          localizations: localizations,
          switchValueSplit: state.switchValueSplit,
          date: state.date,
          switchValueMint: state.switchValueMint,
        ),
      ),
    );
    on<ResetEvent>(
      (event, emit) {
        emit(ServiceState(
          localizations: localizations,
        ));
      },
    );
  }
}
