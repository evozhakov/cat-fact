import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'package:cats_fact/blocs/bloc_fact/fact_bloc.dart';
import 'package:cats_fact/ui/widgets/card_fact/appinio_swiper_widget.dart';
import 'package:cats_fact/ui/custom_drawer.dart';
import 'package:cats_fact/blocs/bloc_service/service_bloc.dart';
import 'package:cats_fact/constants/app_assets.dart';
import 'package:cats_fact/ui/widgets/custom_app_bar.dart';

class CatFacts extends StatelessWidget {
  const CatFacts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isNotEmpty =
        context.select((FactBloc bloc) => bloc.state.swipeCard.isNotEmpty);
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const CustomDrawer(),
      onEndDrawerChanged: (bool isOpened) =>
          context.read<ServiceBloc>().add(OpenCloseDrawerEvent(isOpened)),
      appBar: const CustomAppBar(),
      body: isNotEmpty
          ? const AppinioSwiperWidget()
          : Center(
              child: Lottie.asset(AppAssets.loadingCat),
            ),
    );
  }
}
