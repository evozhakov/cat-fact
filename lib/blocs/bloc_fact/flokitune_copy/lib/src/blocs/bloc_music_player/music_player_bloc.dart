import 'package:bloc/bloc.dart';
import 'package:flokitune/src/models/song/song_model.dart';
import 'package:meta/meta.dart';

part 'music_player_event.dart';
part 'music_player_state.dart';

class MusicPlayerBloc extends Bloc<MusicPlayerEvent, MusicPlayerState> {
  MusicPlayerBloc() : super(const MusicPlayerState()) {
    on<LoadSongEvent>(
      (event, emit) {
        if (event.songListName == state.songListName) {
          emit(
            MusicPlayerState(
              indexSong: event.indexSong,
              songList: state.songList,
              songListName: event.songListName,
              isShowPlayer: true,
              songModel: event.songModel,
            ),
          );
        } else {
          emit(
            MusicPlayerState(
              indexSong: event.indexSong,
              songList: event.songList,
              songListName: event.songListName,
              isShowPlayer: true,
              songModel: event.songModel,
            ),
          );
        }
      },
    );
    on<ChangeSongEvent>(
      (event, emit) {
        int indexSong =
            !event.isPrevious ? state.indexSong + 1 : state.indexSong - 1;
        int listLenght = state.songList.length;
        if (indexSong >= 0 && indexSong < listLenght) {
          emit(
            MusicPlayerState(
              indexSong: indexSong,
              songList: state.songList,
              songListName: state.songListName,
              isShowPlayer: true,
              songModel: state.songList[indexSong],
            ),
          );
        }
      },
    );
    on<ResetPlayerEvent>(
      (event, emit) => emit(
        const MusicPlayerState(),
      ),
    );
  }
}
