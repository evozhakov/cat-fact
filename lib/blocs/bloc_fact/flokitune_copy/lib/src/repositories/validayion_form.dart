import 'package:email_validator/email_validator.dart';
import 'package:flokitune/src/constants/country.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin ValidationForm {
  String? validator(
      String value, String fieldName, AppLocalizations localizations) {
    if (fieldName == localizations.email) {
      if (!EmailValidator.validate(value)) {
        return localizations.validationEmail;
      } else {
        return null;
      }
    }

    if (fieldName == localizations.firstName) {
      if (value.isEmpty) {
        return localizations.validationFirsName;
      } else {
        return null;
      }
    }
    if (fieldName == localizations.lastName) {
      if (value.isEmpty) {
        return localizations.validationLastName;
      } else {
        return null;
      }
    }
    return null;
  }

  String? validatorPinCode(String value, AppLocalizations localizations) {
    if (value.length != 6) {
      return localizations.pinValid;
    } else if (value.length == 6 && value != '123456') {
      //change this when  will be http request
      return localizations.pinValidMatch;
    } else {
      return null;
    }
  }

  String? phoneValidator(String? value, Country country, String validText) {
    if (value != null) {
      return value.length >= country.minLength &&
              value.length <= country.maxLength
          ? null
          : validText;
    }
    return null;
  }
}
