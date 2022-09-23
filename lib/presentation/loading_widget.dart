import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/bloc_fact/fact_bloc.dart';
import 'package:cats_fact/constants/app_colors.dart';
import 'package:cats_fact/presentation/swipe_card.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactBloc, List<SwipeCard>>(
      builder: (context, state) {
        return Center(
          child: state.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.loadCard,
                    ),
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<FactBloc>(context).add(
                          FactEvent(),
                        );
                      },
                      icon: const Icon(
                        Icons.rotate_left_rounded,
                        color: AppColors.color1,
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
