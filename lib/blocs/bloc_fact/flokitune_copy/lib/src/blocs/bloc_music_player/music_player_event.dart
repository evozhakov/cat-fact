part of 'music_player_bloc.dart';

@immutable
abstract class MusicPlayerEvent {}

class LoadSongEvent extends MusicPlayerEvent {
  final List<SongModel> songList;
  final SongListName songListName;
  final SongModel songModel;
  final int indexSong;
  LoadSongEvent({
    required this.songModel,
    required this.songList,
    required this.songListName,
    required this.indexSong,
  });
}

class ChangeSongEvent extends MusicPlayerEvent {
  final bool isPrevious;
  ChangeSongEvent({
    this.isPrevious = false,
  });
}

class ResetPlayerEvent extends MusicPlayerEvent {}
