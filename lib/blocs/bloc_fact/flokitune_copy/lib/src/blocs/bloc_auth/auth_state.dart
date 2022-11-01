part of 'auth_bloc.dart';

@immutable
class AuthState {
  final AppLocalizations localizations;
  final bool isSignIn;
  final int page;
  final Country country;
  final List<Country> countryList;
  final bool switchValueTypeAccount;
  final bool isValidationSignIn;

  const AuthState({
    this.isValidationSignIn = true,
    required this.localizations,
    this.switchValueTypeAccount = true,
    this.isSignIn = true,
    this.page = 1,
    this.country = const Country(),
    this.countryList = countriesListOriginally,
  });

  String get getFlagImagePath =>
      'assets/flags/${country.code.toLowerCase()}.png';
  String flagImagePath(Country country) {
    String path = 'assets/flags/${country.code.toLowerCase()}.png';
    return path;
  }
}
