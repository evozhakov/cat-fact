import 'package:flokitune/src/blocs/bloc_auth/auth_bloc.dart';
import 'package:flokitune/src/repositories/auth_repository.dart';
import 'package:flokitune/src/repositories/validayion_form.dart';
import 'package:flokitune/src/theme_styles/text_styles.dart';
import 'package:flokitune/src/ui/widgets/flags_button.dart';
import 'package:flutter/material.dart';

class PhoneTextField extends StatelessWidget
    with AuthRepository, ValidationForm {
  final AuthState state;
  final TextEditingController phoneController;
  PhoneTextField({
    super.key,
    required this.state,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          state.localizations.phone,
          style: TextStyles.style1,
        ),
        TextFormField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          maxLength: state.country.maxLength,
          decoration: InputDecoration(
            prefixIcon: FlagsButton(
              state: state,
            ),
          ),
          validator: (value) => phoneValidator(
            value,
            state.country,
            state.localizations.validationPhone,
          ),
        ),
      ],
    );
  }
}
