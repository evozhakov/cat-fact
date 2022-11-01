import 'package:flokitune/src/blocs/bloc_music_player/music_player_bloc.dart';
import 'package:flokitune/src/blocs/bloc_navigation/navigation_bloc.dart';
import 'package:flokitune/src/models/song/song_model.dart';
import 'package:flokitune/src/ui/app_bars/custom_app_bar.dart';
import 'package:flokitune/src/ui/app_bars/searh_app_bar_widget.dart';
import 'package:flokitune/src/ui/my_studio/my_studio_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyStudio extends StatelessWidget {
  const MyStudio({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    List<SongModel> temporaryListMySongRevers =
        temporaryListMySong.reversed.toList();
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomAppBar(
            widget: SeartAppBarWidget(
              title: localizations.studio,
              page: Pages.newSongs,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
                builder: (context, playerState) {
                  return MyStudioBody(
                    indexSong: index,
                    songList: temporaryListMySongRevers,
                    song: temporaryListMySongRevers[index],
                    playerState: playerState,
                  );
                },
              );
            },
            childCount: temporaryListMySongRevers.length,
          ),
        ),
      ],
    );
  }
}
