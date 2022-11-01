import 'package:flokitune/src/ui/background/auth_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';

import 'package:flokitune/src/ui/login/sign_in_page.dart';
import 'package:flokitune/src/ui/login/sign_up_page.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController firstNameController = TextEditingController();
    final TextEditingController lastNameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return BlocProvider<AuthBloc>(
      create: (_) => AuthBloc(context),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor:
                !state.isSignIn ? const Color.fromRGBO(8, 18, 37, 1) : null,
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                height: 812.h,
                width: 375.w,
                child: Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    AuthBackground(state: state),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 38.h,
                      ),
                      child: state.isSignIn
                          ? SignInPage(
                              state: state,
                              emailController: emailController,
                            )
                          : SignUpPage(
                              state: state,
                              emailControllerSignUp: emailController,
                              firstNameController: firstNameController,
                              lastNameController: lastNameController,
                              phoneController: phoneController,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
