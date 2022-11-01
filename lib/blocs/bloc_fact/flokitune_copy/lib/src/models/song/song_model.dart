import 'package:intl/intl.dart';

class SongModel {
  final String songName;
  final DateTime? releaseData;
  final String auditions;
  final int rating;
  final String fPlusInt;
  final String artULR;
  final String songULR;
  final String artistName;
  const SongModel({
    this.songName = '',
    this.releaseData,
    this.auditions = '0',
    this.rating = 0,
    this.fPlusInt = 'F0',
    this.artULR = '',
    this.songULR = '',
    this.artistName = '',
  });

  String dateInFormat(String local) =>
      DateFormat.yMMMMd(local).format(releaseData!);
}

List<SongModel> temporaryListMySong = [
  SongModel(
    artistName: 'Kate Bush',
    songName: 'Running Up That Hill',
    releaseData: DateTime(2022, 8, 9),
    auditions: '11,012,945',
    rating: 2,
    fPlusInt: 'F450',
    artULR:
        'https://upload.wikimedia.org/wikipedia/ru/3/38/Kate_Bush_-_Running_up_that_hill.jpg',
    songULR:
        'https://firebasestorage.googleapis.com/v0/b/enlearning-aa1da.appspot.com/o/Kate_Bush_-_Running_Up_That_Hill_(A_Deal_With_God).mp3?alt=media&token=cc092133-446f-43a0-bf99-1e4d9932fffa',
  ),
  SongModel(
    artistName: 'Katy Perry',
    songName: 'Chained To The Rhythm (Official) ft. Skip Marley',
    releaseData: DateTime(2022, 8, 9),
    auditions: '20,012,945',
    rating: 3,
    fPlusInt: 'F500',
    artULR:
        'https://upload.wikimedia.org/wikipedia/en/f/f8/Katy_Perry_-_Chained_to_the_Rhythm_%28Official_Single_Cover%29.png',
    songULR:
        'https://firebasestorage.googleapis.com/v0/b/enlearning-aa1da.appspot.com/o/katy-perry-feat_-skip-marley-chained-to-the-rhythm.mp3?alt=media&token=f745b07a-7e44-4e82-b507-19a0b7435de2',
  ),
  SongModel(
    songName: 'Unholy',
    releaseData: DateTime(2022, 8, 9),
    auditions: '1,224,991,240',
    rating: 1,
    fPlusInt: 'F4500',
    artULR:
        'https://www.billboard.com/wp-content/uploads/2022/09/sam-smith-kim-petras-press-cr-Michael-Bailey-Gates-2022-billboard-1548.jpg',
    songULR:
        'https://firebasestorage.googleapis.com/v0/b/enlearning-aa1da.appspot.com/o/sam-smith-kim-petras-unholy-mp3.mp3?alt=media&token=9d7e0604-f953-4763-8370-e1afd85db6fc',
    artistName: 'Sam Smith, Kim Petras',
  ),
];
