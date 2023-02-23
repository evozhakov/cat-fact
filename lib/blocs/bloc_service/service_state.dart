part of 'service_bloc.dart';

@immutable
class ServiceState {
  final bool drawerIsOpen;
  final int countFact;
  final String locale;
  final bool apiCataasWork;

  const ServiceState({
    this.drawerIsOpen = false,
    required this.countFact,
    required this.locale,
    this.apiCataasWork = true,
  });

  Locale get localedFromSubtags => Locale.fromSubtags(languageCode: locale);

  factory ServiceState.copyWith(
    ServiceState state, {
    bool? drawerIsOpen,
    int? countFact,
    String? locale,
    bool? apiCataasWork,
  }) =>
      ServiceState(
        locale: locale ?? state.locale,
        countFact: countFact ?? state.countFact,
        drawerIsOpen: drawerIsOpen ?? state.drawerIsOpen,
        apiCataasWork: apiCataasWork ?? state.apiCataasWork,
      );
}
