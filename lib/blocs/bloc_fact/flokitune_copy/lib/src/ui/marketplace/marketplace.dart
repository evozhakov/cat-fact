import 'package:flokitune/src/blocs/bloc_navigation/navigation_bloc.dart';
import 'package:flokitune/src/ui/app_bars/custom_app_bar.dart';
import 'package:flokitune/src/ui/app_bars/searh_app_bar_widget.dart';
import 'package:flokitune/src/ui/marketplace/marketplace_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Marketplace extends StatelessWidget {
  const Marketplace({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomAppBar(
            widget: SeartAppBarWidget(
              title: localizations.marketplace,
              page: Pages.addService,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 701.h,
            child: const MarketplaceBody(),
          ),
        ),
      ],
    );
  }
}
