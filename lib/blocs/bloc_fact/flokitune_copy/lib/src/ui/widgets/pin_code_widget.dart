import 'package:flokitune/src/repositories/auth_repository.dart';
import 'package:flokitune/src/repositories/validayion_form.dart';
import 'package:flokitune/src/theme_styles/pin_code_theme.dart';
import 'package:flokitune/src/theme_styles/text_styles.dart';
// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PinCodeWidget extends StatelessWidget
    with ValidationForm, AuthRepository {
  final AppLocalizations localString;
  final String email;
  PinCodeWidget({
    super.key,
    required this.localString,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localString.enterPin,
          textAlign: TextAlign.start,
          style: TextStyles.style1,
        ),
        PinCodeTextField(
          pinTheme: PinCodeTheme.pinTheme,
          textStyle: Theme.of(context).textTheme.subtitle1,
          validator: (value) => validatorPinCode(value!, localString),
          showCursor: false,
          appContext: context,
          length: 6,
          onChanged: (value) {},
        ),
        // 20.verticalSpace,
        // RichText(
        //   text: TextSpan(
        //     style: TextStyles.style1,
        //     text: localString.pinToEmail,
        //     children: [
        //       TextSpan(
        //         text: email,
        //         style: const TextStyle(
        //           color: Color.fromRGBO(0, 102, 255, 1),
        //         ),
        //         recognizer: TapGestureRecognizer()
        //           ..onTap = () => showMailApp(context, localString.noAppMail),
        //       )
        //     ],
        //   ),
        // ),
        // 20.verticalSpace,
        // Text(
        //   'Did not get the email? ',
        //   style: TextStyles.style1,
        //   maxLines: 2,
        // )
      ],
    );
  }
}
