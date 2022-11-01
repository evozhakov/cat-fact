import 'package:bloc/bloc.dart';
import 'package:flokitune/src/constants/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  AuthBloc(BuildContext context)
      : super(
          AuthState(
            localizations: AppLocalizations.of(context)!,
            country: countriesListOriginally.firstWhere(
              (item) =>
                  item.code == AppLocalizations.of(context)!.twoLetterISOCode,
            ),
          ),
        ) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    on<ChangeAuthPage>(
      (event, emit) => emit(
        AuthState(
          localizations: localizations,
          isSignIn: !state.isSignIn,
          country: state.country,
        ),
      ),
    );
    on<ChangePage>(
      (event, emit) => emit(
        AuthState(
          localizations: localizations,
          page: event.page + 1,
        ),
      ),
    );
    on<ChangePhoneCountryEvent>(
      (event, emit) {
        emit(
          AuthState(
            localizations: localizations,
            country: event.selectedCountry,
            isSignIn: state.isSignIn,
          ),
        );
      },
    );
    on<SearchCountryEvent>(
      (event, emit) {
        emit(
          AuthState(
            localizations: localizations,
            isSignIn: state.isSignIn,
            country: state.country,
            countryList: countriesListOriginally
                .where(
                  (element) => element.name.toLowerCase().contains(
                        event.value.toLowerCase(),
                      ),
                )
                .toList(),
          ),
        );
      },
    );
    on<SendCodeSignIn>(
      (event, emit) {
        emit(
          AuthState(
            localizations: localizations,
            isSignIn: state.isSignIn,
            isValidationSignIn: false,
            country: state.country,
          ),
        );
      },
    );
  }
}
