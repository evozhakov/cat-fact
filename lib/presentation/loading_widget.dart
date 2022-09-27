import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';




class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactBloc, FactState>(
      builder: (context, state) {
        return Center(
          child: state.swipeCard.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.loadCard,
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<FactBloc>(context).add(
                          MoreLoadEvent(),
                        );
                      },
                      icon: const Icon(
                        Icons.rotate_left_rounded,
                      
                        size: 40,
                      ),
                    ),
                  ],
                )
              : const CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
