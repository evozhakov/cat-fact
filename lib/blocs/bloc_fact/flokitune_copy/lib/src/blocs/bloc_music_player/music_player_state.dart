part of 'music_player_bloc.dart';

@immutable
class MusicPlayerState {
  final List<SongModel> songList;
  final SongListName songListName;
  final bool isShowPlayer;
  final SongModel songModel;
  final int indexSong;
  const MusicPlayerState({
    this.songListName = SongListName.empty,
    this.songList = const [],
    this.isShowPlayer = false,
    this.songModel = const SongModel(),
    this.indexSong = 0,
  });
}

enum SongListName {
  myStudio,
  musicPlaying,
  topWeek,
  empty,
}
