import 'package:flokitune/src/blocs/bloc_music_player/music_player_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/models/song/song_model.dart';
import 'package:flokitune/src/ui/general_scaffold.dart';
import 'package:flokitune/src/ui/widgets/custom_rating_bar.dart';
import 'package:flokitune/src/ui/widgets/image_song_widget.dart';
import 'package:flokitune/src/ui/widgets/info_song_widget.dart';
import 'package:flokitune/src/ui/widgets/name_song_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyStudioBody extends StatelessWidget {
  final SongModel song;
  final List<SongModel> songList;
  final MusicPlayerState playerState;
  final int indexSong;
  const MyStudioBody({
    super.key,
    required this.playerState,
    required this.song,
    required this.songList,
    required this.indexSong,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => song.songName == playerState.songModel.songName
              ? panelController.open()
              : BlocProvider.of<MusicPlayerBloc>(context).add(
                  LoadSongEvent(
                    indexSong: indexSong,
                    songList: songList,
                    songModel: song,
                    songListName: SongListName.myStudio,
                  ),
                ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ImageSong(imageULR: song.artULR),
              12.3.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  NameSongWidget(
                    width: 200.w,
                    fontSize: 16.sp,
                    songName: song.songName,
                    changeColor:
                        song.songName == playerState.songModel.songName,
                  ),
                  6.verticalSpace,
                  InfoSongWidget(
                    song: song,
                    useDateTime: true,
                    width: 200.w,
                  ),
                  7.verticalSpace,
                ],
              ),
              const Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    song.fPlusInt,
                    style: TextStyle(
                        color: const Color.fromRGBO(150, 154, 160, 1),
                        fontFamily: AppAssets.fontJakarta,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                  6.64.verticalSpace,
                  CustomRatingBar(
                    rating: song.rating,
                  ),
                  7.verticalSpace,
                ],
              ),
            ],
          ),
        ),
        16.verticalSpace,
        Divider(
          thickness: 1.h,
        ),
        16.verticalSpace,
      ],
    );
  }
}
