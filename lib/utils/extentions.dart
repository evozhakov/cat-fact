import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

import 'package:cats_fact/ui/screens/fact_history.dart';
import 'package:cats_fact/ui/screens/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum DrawerItems {
  history,
  settings,
}

extension DrawerItem on DrawerItems {
  IconData get icon {
    switch (this) {
      case DrawerItems.history:
        return FontAwesomeIcons.heart;
      case DrawerItems.settings:
        return Icons.settings;
    }
  }

  String text(AppLocalizations local) {
    switch (this) {
      case DrawerItems.history:
        return local.titleHistory;
      case DrawerItems.settings:
        return local.settings;
    }
  }

  void navigation(BuildContext context) {
    Navigator.of(context).pop();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          switch (this) {
            case DrawerItems.history:
              return const FactHistory();
            case DrawerItems.settings:
              return const Settings();
          }
        },
      ),
    );
  }
}
