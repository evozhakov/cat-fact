import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flokitune/src/repositories/auth_repository.dart';
import 'package:flokitune/src/ui/widgets/custom_elevated_button.dart';
import 'package:flokitune/src/ui/widgets/custom_form.dart';
import 'package:flokitune/src/ui/widgets/custom_rich_text.dart';
import 'package:flokitune/src/ui/widgets/form_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_assets.dart';

class SignUpPage extends StatelessWidget with AuthRepository {
  final AuthState state;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailControllerSignUp;
  final TextEditingController phoneController;
  SignUpPage({
    super.key,
    required this.state,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailControllerSignUp,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeySIgnUp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          90.05.verticalSpace,
          SizedBox(
            width: 327.w,
            height: 76.h,
            child: Text(
              state.localizations.createAccount,
              style: TextStyle(
                fontSize: 32.sp,
                fontFamily: AppAssets.fontJakarta,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          30.17.verticalSpace,
          Row(
            children: [
              SizedBox(
                width: 153.w,
                child: CustomTextField(
                  controller: firstNameController,
                  fieldName: state.localizations.firstName,
                ),
              ),
              21.horizontalSpace,
              SizedBox(
                width: 153.w,
                child: CustomTextField(
                  controller: lastNameController,
                  fieldName: state.localizations.lastName,
                ),
              ),
            ],
          ),
          20.verticalSpace,
          CustomTextField(
            controller: emailControllerSignUp,
            fieldName: state.localizations.email,
          ),
          20.verticalSpace,
          PhoneTextField(
            state: state,
            phoneController: phoneController,
          ),
          const Spacer(),
          CustomElevatedButton(
            text: state.localizations.next,
            onTap: () => createAccount(context),
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
