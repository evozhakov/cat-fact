part of 'service_bloc.dart';

@immutable
class ServiceState {
  final bool drawerIsOpen;
  final int countFact;
  final String locale;
  final bool apiCataasWork;
  final User? currentUser;

  const ServiceState({
    required this.currentUser,
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
    User? currentUser,
  }) =>
      ServiceState(
        currentUser: state.currentUser,
        locale: locale ?? state.locale,
        countFact: countFact ?? state.countFact,
        drawerIsOpen: drawerIsOpen ?? state.drawerIsOpen,
        apiCataasWork: apiCataasWork ?? state.apiCataasWork,
      );
  factory ServiceState.logOut(ServiceState state) => ServiceState(
        locale: state.locale,
        countFact: state.countFact,
        drawerIsOpen: state.drawerIsOpen,
        apiCataasWork: state.apiCataasWork,
        currentUser: null,
      );
}
