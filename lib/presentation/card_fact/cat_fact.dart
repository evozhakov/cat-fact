import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';
import 'package:cats_fact/presentation/loading_widget.dart';
import 'package:cats_fact/presentation/custom_drawer.dart';
import 'package:cats_fact/repository/repository_imports.dart';

class CatFacts extends StatelessWidget {
  const CatFacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    AppinioSwiperController controller = AppinioSwiperController();
    return BlocProvider<FactBloc>(
      create: (context) => FactBloc(controller, context)
        ..add(
          FirstLoadEvent(),
        ),
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: const CustomDrawer(),
        appBar: AppBar(
          title: const FaIcon(
            FontAwesomeIcons.cat,
          ),
          actions: [
            IconButton(
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              icon: const Icon(
                Icons.keyboard_arrow_left,
                size: 30,
              ),
            )
          ],
        ),
        body: BlocBuilder<FactBloc, FactState>(
          builder: (context, state) {
            return Stack(
              children: [
                const LoadingWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.80,
                  child: AppinioSwiper(
                    unlimitedUnswipe: true,
                    controller: controller,
                    unswipe: cardRrepository.unswipe,
                    cards: state.swipeCard,
                    onSwipe: cardRrepository.swipe,
                    padding: const EdgeInsets.all(25),
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
