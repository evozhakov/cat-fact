import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flokitune/src/constants/country.dart';
import 'package:flokitune/src/ui/general_scaffold.dart';
import 'package:flokitune/src/ui/onboarding/onboarding_page.dart';
import 'package:flokitune/src/ui/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_mail_app/open_mail_app.dart';

mixin AuthRepository {
  final GlobalKey<FormState> formKeySIgnUp = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();

  Future<void> showCountries(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromRGBO(12, 27, 54, 1),
      builder: (_) => CountriesListBottomSheet(
        sheetContext: _,
        onCountryChanged: (Country selectedCountry) {
          BlocProvider.of<AuthBloc>(context).add(
            ChangePhoneCountryEvent(
              selectedCountry: selectedCountry,
            ),
          );
        },
      ),
    );
  }

  void createAccount(BuildContext context) {
    if (formKeySIgnUp.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: ((context) => const OnboardingPage()),
        ),
      );
    }
  }

  void sendCode(BuildContext context, AuthState state) {
    if (formKeySignIn.currentState!.validate()) {
      state.isValidationSignIn
          ? context.read<AuthBloc>().add(
                SendCodeSignIn(),
              )
          : Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((context) => const GeneralScaffold()),
              ),
            );
    }
  }

  void showMailApp(context, String noAppMail) async {
    final result = await OpenMailApp.openMailApp();

    if (!result.didOpen && !result.canOpen) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            noAppMail,
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else if (!result.didOpen && result.canOpen) {
      showDialog(
        context: context,
        builder: (_) {
          return MailAppPickerDialog(
            mailApps: result.options,
          );
        },
      );
    }
  }
}
