import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/models/song/song_model.dart';
import 'package:flokitune/src/ui/widgets/custom_rating_bar.dart';
import 'package:flokitune/src/ui/widgets/image_song_widget.dart';
import 'package:flokitune/src/ui/widgets/info_song_widget.dart';
import 'package:flokitune/src/ui/widgets/name_song_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../blocs/bloc_music_player/music_player_bloc.dart';

class NowPlayingBody extends StatelessWidget {
  final SongModel songModel;
  final PlayerController playerController;
  final String newPosition;
  final Function playOrPausePlayer;
  final String maxDur;
  const NowPlayingBody({
    super.key,
    required this.playerController,
    required this.newPosition,
    required this.maxDur,
    required this.playOrPausePlayer,
    required this.songModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageSong(
          size: ImageSongSize.large,
          imageULR: songModel.artULR,
        ),
        36.verticalSpace,
        Row(
          children: [
            NameSongWidget(
              width: 278.w,
              fontSize: 18.sp,
              songName: songModel.songName,
            ),
            const Spacer(),
            const CustomRatingBar(
              rating: 2,
            ),
          ],
        ),
        11.verticalSpace,
        InfoSongWidget(song: songModel, width: 327.w),
        const Spacer(),
        playerController.playerState != PlayerState.stopped
            ? AudioFileWaveforms(
                size: Size(327.w, 75.h),
                playerController: playerController,
                density: 3,
                playerWaveStyle: const PlayerWaveStyle(
                  fixedWaveColor: Color.fromRGBO(150, 154, 160, 1),
                  liveWaveColor: Color.fromRGBO(217, 15, 72, 1),
                  waveCap: StrokeCap.round,
                  waveThickness: 4,
                  scaleFactor: 0.5,
                ),
              )
            : 75.verticalSpace,
        13.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(newPosition), Text(maxDur)],
        ),
        30.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () => BlocProvider.of<MusicPlayerBloc>(context).add(
                      ChangeSongEvent(isPrevious: true),
                    ),
                child: SvgPicture.asset(AppAssets.previousSong)),
            44.horizontalSpace,
            SizedBox.square(
              dimension: 81.r,
              child: FloatingActionButton(
                backgroundColor: const Color.fromRGBO(218, 21, 76, 1),
                onPressed: () => playOrPausePlayer(),
                child: SvgPicture.asset(
                  playerController.playerState == PlayerState.playing
                      ? 'assets/images/pause.svg'
                      : AppAssets.iconPlay,
                  width: 26.w,
                  height: 30.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            44.horizontalSpace,
            InkWell(
              onTap: () => BlocProvider.of<MusicPlayerBloc>(context).add(
                ChangeSongEvent(),
              ),
              child: SvgPicture.asset(AppAssets.nextSong),
            ),
          ],
        ),
        50.verticalSpace,
      ],
    );
  }
}
