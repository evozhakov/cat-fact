import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FirstCard extends StatelessWidget {
  const FirstCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.keyboard_arrow_up,
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.keyboard_arrow_left,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  AppLocalizations.of(context)!.swipe,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.keyboard_arrow_right,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Icon(
          Icons.keyboard_arrow_down,
        ),
      ],
    );
  }
}
