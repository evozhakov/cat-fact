import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/repository/repository_imports.dart';
import 'package:cats_fact/constants/app_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    dynamic text = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _button(
          context: context,
          page: Pages.history,
          icon: FontAwesomeIcons.heart,
          text: text!.titleHistory,
        ),
        _button(
          context: context,
          page: Pages.settings,
          icon: Icons.settings,
          text: text!.settings,
        )
      ],
    );
  }

  Widget _button({
    required context,
    required Pages page,
    required IconData icon,
    required String text,
  }) {
    return TextButton.icon(
      onPressed: () => cardRrepository.showBar(
        context,
        page,
      ),
      icon: Icon(
        icon,
        color: AppColors.color2,
      ),
      label: Text(
        text,
        style: const TextStyle(
          color: AppColors.color2,
          fontSize: 20,
        ),
      ),
    );
  }
}
