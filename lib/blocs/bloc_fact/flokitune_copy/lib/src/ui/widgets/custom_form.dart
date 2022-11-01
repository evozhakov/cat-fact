import 'package:flokitune/src/repositories/auth_repository.dart';
import 'package:flokitune/src/repositories/validayion_form.dart';
import 'package:flokitune/src/theme_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomTextField extends StatelessWidget
    with AuthRepository, ValidationForm {
  final String fieldName;
  final TextEditingController controller;
  CustomTextField({
    super.key,
    required this.controller,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: TextStyles.style1,
        ),
        TextFormField(
          validator: (value) => validator(value!, fieldName, localizations),
          controller: controller,
        ),
      ],
    );
  }
}
