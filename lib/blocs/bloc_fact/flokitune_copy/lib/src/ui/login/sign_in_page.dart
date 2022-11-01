import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flokitune/src/repositories/auth_repository.dart';
import 'package:flokitune/src/ui/widgets/custom_elevated_button.dart';
import 'package:flokitune/src/ui/widgets/custom_form.dart';
import 'package:flokitune/src/ui/widgets/custom_rich_text.dart';
import 'package:flokitune/src/ui/widgets/pin_code_widget.dart';
import 'package:flokitune/src/ui/widgets/rich_text_welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInPage extends StatelessWidget with AuthRepository {
  final AuthState state;
  final TextEditingController emailController;
  SignInPage({
    super.key,
    required this.state,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localString = state.localizations;
    return Form(
      key: formKeySignIn,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichTextWelcome(
            welcomeTo: localString.welcomeTo,
          ),
          40.verticalSpace,
          state.isValidationSignIn
              ? CustomTextField(
                  fieldName: localString.email,
                  controller: emailController,
                )
              : PinCodeWidget(
                  localString: localString,
                  email: emailController.text,
                ),
          210.verticalSpace,
          CustomElevatedButton(
            text:
                state.isValidationSignIn ? localString.next : localString.login,
            onTap: () => sendCode(context, state),
          ),
          50.verticalSpace,
          CustomRichText(
            state: state,
          ),
        ],
      ),
    );
  }
}
