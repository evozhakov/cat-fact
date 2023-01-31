import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static showSnackBar(
    String text, {
    String? labelButton,
    Function? onTap,
  }) {
    final nullValue = labelButton == null || onTap == null;
    final snackBar = SnackBar(
      content: Text(text),
      action: !nullValue
          ? SnackBarAction(
              textColor: Colors.white,
              label: labelButton,
              onPressed: () => onTap(),
            )
          : null,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
