import 'package:flokitune/src/ui/app_bars/back_button_widget.dart';
import 'package:flokitune/src/ui/app_bars/custom_app_bar.dart';
import 'package:flokitune/src/ui/music_playing/music_playing_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MusicPlaying extends StatelessWidget {
  const MusicPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomAppBar(
              widget: AppBarBackButtonWidget(
            title: localizations.playing,
            showPopupMenu: true,
          )),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 701.h,
          child: const MusicPlayingBody(),
        )),
      ],
    );
  }
}