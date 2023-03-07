import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';
import 'package:cats_fact/repository/auth_repository.dart';
import 'package:cats_fact/repository/history_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:cats_fact/models/fact/fact_model.dart';

class IconSaveFact extends StatelessWidget {
  final FactModel catFact;
  const IconSaveFact(this.catFact, {super.key});

  @override
  Widget build(BuildContext context) {
    final historyRepository = HistoryRepository();
    final haveUser =
        context.select((ServiceBloc bloc) => bloc.state.currentUser != null);

    if (haveUser) {
      return StreamBuilder(
        stream: historyRepository.facts(),
        builder: (_, facts) {
          final data = facts.data ?? [];
          final isContain = data.any((e) => e.id == catFact.id);

          return _icon(
            onTap: () => isContain
                ? historyRepository.deleteFact(catFact)
                : historyRepository.saveFact(catFact),
            icon: isContain
                ? FontAwesomeIcons.heartCrack
                : FontAwesomeIcons.solidHeart,
          );
        },
      );
    } else {
      return _icon(
          onTap: () => AuthRepository.showAuthDialog(context, catFact));
    }
  }

  Widget _icon({
    IconData? icon = FontAwesomeIcons.solidHeart,
    required Function onTap,
  }) {
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(
        onPressed: () => onTap(),
        icon: FaIcon(
          icon,
          color: Colors.red,
          size: 30,
        ),
      ),
    );
  }
}
