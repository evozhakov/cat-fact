import 'package:cats_fact/models/settings/settings_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final SettingsModel settings;
  ServiceBloc(this.settings)
      : super(ServiceState(
            currentUser: FirebaseAuth.instance.currentUser,
            countFact: settings.countFact,
            locale: settings.locale)) {
    on<OpenCloseDrawerEvent>(
      (event, emit) => emit(
        ServiceState.copyWith(state, drawerIsOpen: event.isOpen),
      ),
    );
    on<ChangeCountFactEvent>(
      (event, emit) => emit(
        ServiceState.copyWith(
          state,
          countFact: event.value,
        ),
      ),
    );
    on<ChangeLanguageEvent>(
      (event, emit) => emit(
        ServiceState.copyWith(
          state,
          locale: event.locale,
        ),
      ),
    );
    on<CataasNotWorkEvent>(
      (event, emit) => emit(
        ServiceState.copyWith(state, apiCataasWork: false),
      ),
    );
    on<LogOutEvent>(
      (event, emit) => emit(
        ServiceState.logOut(state),
      ),
    );
    on<SignInEvent>(
      (event, emit) => emit(
        ServiceState.copyWith(
          state,
          currentUser: event.currentUser,
        ),
      ),
    );
  }
}
