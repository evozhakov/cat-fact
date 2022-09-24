import 'package:cats_fact/repository/hive_box_repository.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_fact/bloc_fact/fact_bloc.dart';
import 'package:cats_fact/repository/card_repository.dart';
import 'package:cats_fact/constants/app_colors.dart';
import 'package:cats_fact/presentation/fact_history.dart';
import 'package:cats_fact/presentation/loading_widget.dart';
import 'package:cats_fact/presentation/swipe_card.dart';
import 'package:cats_fact/repository/fact_repository.dart';

class CatFacts extends StatelessWidget {
  const CatFacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppinioSwiperController controller = AppinioSwiperController();
    return BlocProvider<FactBloc>(
      create: (context) => FactBloc(controller, context)
        ..add(
          FirstEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.colorNull,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.book,
                color: AppColors.color1,
              ),
              onPressed: () => showBarModalBottomSheet(
                expand: true,
                context: context,
                backgroundColor: AppColors.color2,
                builder: (context) => const FactHistory(),
              ),
            ),
          ],
          centerTitle: true,
          title: const FaIcon(
            FontAwesomeIcons.cat,
            color: AppColors.color1,
          ),
        ),
        body: BlocBuilder<FactBloc, List<SwipeCard>>(
          builder: (context, state) {
            return Stack(
              children: [
                const LoadingWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: AppinioSwiper(
                    unlimitedUnswipe: true,
                    controller: controller,
                    unswipe: cardRrepository.unswipe,
                    cards: state,
                    onSwipe: cardRrepository.swipe,
                    padding: const EdgeInsets.only(
                      left: 25,
                      right: 25,
                      top: 50,
                      bottom: 40,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

FactRepository factRepository = FactRepository();
CardRepository cardRrepository = CardRepository();
HiveRepository hiveRepository = HiveRepository();
