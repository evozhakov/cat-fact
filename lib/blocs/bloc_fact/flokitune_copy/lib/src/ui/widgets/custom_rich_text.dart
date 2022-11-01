import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomRichText extends StatelessWidget {
  final AuthState state;
  const CustomRichText({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalizations text = state.localizations;

    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: 12.sp,
            color: const Color.fromRGBO(187, 191, 199, 1),
          ),
          text: state.isSignIn ? text.noAccount : text.haveAccount,
          children: [
            TextSpan(
              text: state.isSignIn ? text.signUp : text.signIn,
              recognizer: TapGestureRecognizer()
                ..onTap = () => BlocProvider.of<AuthBloc>(context).add(
                      ChangeAuthPage(),
                    ),
              style: const TextStyle(
                color: Color.fromRGBO(0, 102, 255, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
