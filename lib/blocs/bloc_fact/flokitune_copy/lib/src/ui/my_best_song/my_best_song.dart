import 'package:flokitune/src/models/song/song_model.dart';
import 'package:flokitune/src/ui/app_bars/back_button_widget.dart';
import 'package:flokitune/src/ui/app_bars/custom_app_bar.dart';
import 'package:flokitune/src/ui/my_best_song/my_best_song_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/bloc_service/service_bloc.dart';

class MyBestSong extends StatelessWidget {
  final Function functionClaer;
  final String nameSong;
  const MyBestSong({
    super.key,
    required this.functionClaer,
    required this.nameSong,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceBloc, ServiceState>(
      builder: (context, state) {
        // SongModel newSong = SongModel(
        //     songName: nameSong,
        //     releaseData: state.date ?? DateTime.now(),
        //     auditions: '0',
        //     rating: 0,
        //     fPlusInt: 'F0',
        //     artULR: 'https://f4.bcbits.com/img/0018174587_10.jpg');
        return CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomAppBar(
                widget: AppBarBackButtonWidget(
                  title: state.localizations.myBestSongs,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: MyBestSongBody(
                functionClaer: functionClaer,
                state: state,
                // song: newSong,
              ),
            ),
          ],
        );
      },
    );
  }
}
