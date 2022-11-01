import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flokitune/src/models/song/song_model.dart';
import 'package:flokitune/src/ui/app_bars/back_button_widget.dart';
import 'package:flokitune/src/ui/app_bars/custom_app_bar.dart';
import 'package:flokitune/src/ui/general_scaffold.dart';
import 'package:flokitune/src/ui/now_playing/now_playing_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NowPlaying extends StatelessWidget {
  final SongModel songModel;
  final PlayerController playerController;
  final String newPosition;
  final Function playOrPausePlayer;
  final String maxDur;
  const NowPlaying({
    super.key,
    required this.playerController,
    required this.newPosition,
    required this.playOrPausePlayer,
    required this.maxDur,
    required this.songModel,
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return WillPopScope(
      onWillPop: () async {
        panelController.close();
        return false;
      },
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: CustomAppBar(
              showGradient: false,
              widget: AppBarBackButtonWidget(
                title: localizations.nowPlaying,
                showPopupMenu: true,
                otherFunk: true,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 701.h,
              child: NowPlayingBody(
                maxDur: maxDur,
                newPosition: newPosition,
                playOrPausePlayer: () => playOrPausePlayer(),
                playerController: playerController,
                songModel: songModel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
