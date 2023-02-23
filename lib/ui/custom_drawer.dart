import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/utils/extentions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          DrawerButton(DrawerItems.catWithText),
          SizedBox(height: 10),
          DrawerButton(DrawerItems.history),
          SizedBox(height: 10),
          DrawerButton(DrawerItems.settings),
        ],
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {
  final DrawerItems item;
  const DrawerButton(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    const radius = Radius.circular(30);

    return Container(
      width: 250,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        color: Colors.white,
      ),
      child: TextButton.icon(
        onPressed: () => DrawerItem(item).navigation(context),
        icon: Icon(
          DrawerItem(item).icon,
          color: Colors.black,
        ),
        label: Text(
          DrawerItem(item).text(local),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
