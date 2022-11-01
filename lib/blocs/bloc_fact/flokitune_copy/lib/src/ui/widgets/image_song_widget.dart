import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSong extends StatelessWidget {
  final ImageSongSize size;
  final String imageULR;

  const ImageSong({
    super.key,
    this.size = ImageSongSize.medium,
    this.imageULR = '',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: GetImageSongSize(size).getWidgth,
      height: GetImageSongSize(size).getHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(GetImageSongSize(size).getRadius),
        ),
        child: Image.network(
          imageULR == ''
              ? 'https://upload.wikimedia.org/wikipedia/uk/c/c6/Justin_Bieber_-_Hold_On.png?20210311151206'
              : imageULR,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

enum ImageSongSize {
  large,
  medium,
  mini,
}

extension GetImageSongSize on ImageSongSize {
  double get getHeight {
    switch (this) {
      case ImageSongSize.mini:
        return 43.h;
      case ImageSongSize.medium:
        return 56.h;
      case ImageSongSize.large:
        return 311.h;
    }
  }

  double get getWidgth {
    switch (this) {
      case ImageSongSize.mini:
        return 44.w;
      case ImageSongSize.medium:
        return 57.4.w;
      case ImageSongSize.large:
        return 327.w;
    }
  }

  double get getRadius {
    switch (this) {
      case ImageSongSize.mini:
        return 8.r;
      case ImageSongSize.medium:
        return 8.r;
      case ImageSongSize.large:
        return 15.h;
    }
  }
}
