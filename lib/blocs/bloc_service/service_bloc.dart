
import 'package:cats_fact/models/settings/settings_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  final SettingsModel settings;
  ServiceBloc(this.settings)
      : super(ServiceState(countFact: settings.countFact)) {
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
  }
}
