import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';

class FirstCard extends StatelessWidget {
  final Duration duration;
  const FirstCard({
    super.key,
    this.duration = const Duration(
      milliseconds: 500,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactBloc, FactState>(
      builder: (context, state) {
        return AnimatedPadding(
          padding: EdgeInsets.all(state.animation ? 0 : 20),
          duration: duration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _animatedIconSize(
                state.animation,
                Icons.keyboard_arrow_up,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _animatedIconSize(
                      state.animation,
                      Icons.keyboard_arrow_left,
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
                    _animatedIconSize(
                      state.animation,
                      Icons.keyboard_arrow_right,
                    ),
                  ],
                ),
              ),
              _animatedIconSize(
                state.animation,
                Icons.keyboard_arrow_down,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _animatedIconSize(
    bool animation,
    IconData icon,
  ) {
    return AnimatedSize(
      duration: duration,
      child: Icon(
        icon,
        size: animation ? 40 : 30,
      ),
    );
  }
}
