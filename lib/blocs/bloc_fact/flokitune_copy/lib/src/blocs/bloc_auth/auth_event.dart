part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class ChangeAuthPage extends AuthEvent {}

class ChangePage extends AuthEvent {
  final int page;
  ChangePage({required this.page});
}

class ChangePhoneCountryEvent extends AuthEvent {
  final Country selectedCountry;
  ChangePhoneCountryEvent({
    required this.selectedCountry,
  });
}

class SearchCountryEvent extends AuthEvent {
  final String value;
  SearchCountryEvent({
    required this.value,
  });
}

class LoadPageContetntEvent extends AuthEvent {}

class SendCodeSignIn extends AuthEvent {}
