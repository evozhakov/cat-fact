part of 'service_bloc.dart';

@immutable
class ServiceState {
  final bool drawerIsOpen;
  final int countFact;

  const ServiceState({
    this.drawerIsOpen = false,
    required this.countFact,
  });

  factory ServiceState.copyWith(
    ServiceState state, {
    bool? drawerIsOpen,
    int? countFact,
  }) =>
      ServiceState(
        countFact: countFact ?? state.countFact,
        drawerIsOpen: drawerIsOpen ?? state.drawerIsOpen,
      );
}
