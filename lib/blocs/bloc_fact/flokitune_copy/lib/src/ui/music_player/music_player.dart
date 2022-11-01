import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flokitune/src/blocs/bloc_music_player/music_player_bloc.dart';
import 'package:flokitune/src/blocs/bloc_navigation/navigation_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/models/song/song_model.dart';
import 'package:flokitune/src/ui/general_scaffold.dart';
import 'package:flokitune/src/ui/now_playing/now_playing.dart';
import 'package:flokitune/src/ui/widgets/image_song_widget.dart';
import 'package:flokitune/src/ui/widgets/info_song_widget.dart';
import 'package:flokitune/src/ui/widgets/name_song_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MusicPlayer extends StatefulWidget {
  final MusicPlayerState playerState;
  final NavigationState navigationState;
  const MusicPlayer({
    super.key,
    required this.navigationState,
    required this.playerState,
  });

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> with WidgetsBindingObserver {
  late final PlayerController playerController;

  late Directory appDirectory;
  int duration = 0;
  @override
  void initState() {
    super.initState();
    _getDir();
    _initialiseControllers();
    playerController.onCurrentDurationChanged.listen(
      (dur) {
        setState(
          () {
            duration = dur;
          },
        );
      },
    );
  }

  @override
  void didUpdateWidget(covariant MusicPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.playerState.songModel.songULR !=
        oldWidget.playerState.songModel.songULR) {
      _getDir();
      _initialiseControllers();
    }
  }

  void _getDir() async {
    appDirectory = await getApplicationDocumentsDirectory();
    _preparePlayers();
  }

  void _initialiseControllers() {
    playerController = PlayerController()
      ..addListener(
        () {
          if (mounted) setState(() {});
        },
      );
  }

  void _preparePlayers() async {
    await DefaultCacheManager()
        .getSingleFile(widget.playerState.songModel.songULR)
        .then((value) => playerController.preparePlayer(value.path))
        .whenComplete(
          () => playerController.startPlayer(),
        );
  }

  void _disposeControllers() {
    playerController.stopAllPlayers();
  }

  @override
  void dispose() {
    _disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SongModel song = widget.playerState.songModel;
    return InkWell(
      onTap: () => panelController.open(),
      child: SlidingUpPanel(
        controller: panelController,
        color: const Color.fromRGBO(12, 27, 54, 1),
        padding: EdgeInsets.only(left: 23.w, right: 25.w),
        minHeight: widget.navigationState.botomNavigatorBarIsVisible ? 86 : 0,
        panel: NowPlaying(
          songModel: song,
          maxDur: maxDur,
          playOrPausePlayer: () => _playOrPausePlayer(playerController),
          newPosition: newPosition,
          playerController: playerController,
        ),
        onPanelOpened: () => setState(() {}),
        onPanelClosed: () => setState(() {}),
        collapsed: Container(
          height: 86.h,
          color: const Color.fromRGBO(12, 27, 54, 1),
          child: Row(
            children: [
              ImageSong(
                size: ImageSongSize.mini,
                imageULR: song.artULR,
              ),
              14.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NameSongWidget(
                    width: 185.w,
                    fontSize: 18.sp,
                    songName: song.songName,
                  ),
                  9.verticalSpace,
                  InfoSongWidget(
                    song: song,
                    width: 185.w,
                  ),
                  20.verticalSpace,
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () => _playOrPausePlayer(playerController),
                child: SizedBox.square(
                  dimension: 29.r,
                  child: SvgPicture.asset(
                    playerController.playerState == PlayerState.playing
                        ? 'assets/images/pause.svg'
                        : AppAssets.iconPlay,
                    fit: BoxFit.fill,
                    color: const Color.fromRGBO(217, 15, 72, 1),
                  ),
                ),
              ),
              25.horizontalSpace,
              InkWell(
                onTap: () => BlocProvider.of<MusicPlayerBloc>(context)
                    .add(ChangeSongEvent()),
                child: SizedBox.square(
                  dimension: 24.r,
                  child: SvgPicture.asset(
                    AppAssets.nextSong,
                    color: const Color.fromRGBO(219, 230, 254, 1),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
        maxHeight: 812.h,
      ),
    );
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String durationString = '$twoDigitMinutes:$twoDigitSeconds';
    return durationString;
  }

  String get newPosition => _printDuration(
        Duration(milliseconds: duration),
      );
  String get maxDur => _printDuration(
        Duration(milliseconds: playerController.maxDuration),
      );
  void _playOrPausePlayer(PlayerController controller) async {
    controller.playerState == PlayerState.playing
        ? await controller.pausePlayer()
        : await controller.startPlayer(finishMode: FinishMode.pause);
  }
}
