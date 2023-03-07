import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:cats_fact/repository/auth_repository.dart';
import 'package:cats_fact/repository/history_repository.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthDialog extends StatelessWidget {
  final FactModel fact;
  const AuthDialog(this.fact, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/20894-lazy-cat.json'),
          const Text(
            'In order to save the fact, you need to have an account.',
            textAlign: TextAlign.center,
          ), //to local
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: () {
            AuthRepository()
                .signIn(context)
                .whenComplete(() => HistoryRepository().saveFact(fact))
                .whenComplete(() => Navigator.pop(context));
          },

          child: Text('Sign In'), //to local
        ),
        TextButton(
          onPressed: () {
            AuthRepository()
                .logOut(context)
                .whenComplete(() => Navigator.pop(context));
          },
          child: Text('Sign Out'), //to local
        ),
      ],
    );
  }
}
