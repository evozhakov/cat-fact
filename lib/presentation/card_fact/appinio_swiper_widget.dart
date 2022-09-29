import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_fact/presentation/card_fact/swipe_card.dart';
import 'package:cats_fact/repository/repository_imports.dart';
import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';

class AppinioSwiperWidget extends StatelessWidget {
  final FactState state;
  const AppinioSwiperWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _appinioSwiper(
          isFirs: false,
          context: context,
          cards: state.swipeCard,
        ),
        AnimatedSlide(
          offset:
              state.animation ? const Offset(0.15, 0.02) : const Offset(0, 0),
          duration: const Duration(
            milliseconds: 500,
          ),
          child: _appinioSwiper(
            isFirs: true,
            context: context,
            cards: state.firstSwipeCard,
          ),
        ),
      ],
    );
  }

  Widget _appinioSwiper({
    required BuildContext context,
    required List<SwipeCard> cards,
    required bool isFirs,
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.80,
      child: AppinioSwiper(
        unswipe: cardRrepository.unswipe,
        cards: cards,
        onEnd: () => !isFirs
            ? context.read<FactBloc>().add(
                  MoreLoadEvent(),
                )
            : null,
        onSwipe: cardRrepository.swipe,
        padding: const EdgeInsets.all(25),
      ),
    );
  }
}
