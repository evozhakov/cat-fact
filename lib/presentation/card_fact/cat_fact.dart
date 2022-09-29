import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';
import 'package:cats_fact/presentation/card_fact/appinio_swiper_widget.dart';
import 'package:cats_fact/presentation/custom_drawer.dart';

class CatFacts extends StatelessWidget {
  const CatFacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocProvider<FactBloc>(
      create: (context) => FactBloc(context)
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
            return state.swipeCard.isNotEmpty
                ? AppinioSwiperWidget(
                    state: state,
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
          },
        ),
      ),
    );
  }
}
