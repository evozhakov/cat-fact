import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/models/song/song_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoSongWidget extends StatelessWidget {
  final bool useDateTime;
  final double width;
  final SongModel song;
  const InfoSongWidget({
    super.key,
    required this.song,
    this.useDateTime = false,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final AppLocalizations localizations = AppLocalizations.of(context)!;
    return SizedBox(
      width: width,
      child: FadingEdgeScrollView.fromSingleChildScrollView(
        gradientFractionOnEnd: 0.7,
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Text(
                useDateTime
                    ? song.dateInFormat(localizations.localeName)
                    : song.artistName,
                style: TextStyle(
                    color: const Color.fromRGBO(150, 154, 160, 1),
                    fontFamily: AppAssets.fontJakarta,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp),
              ),
              8.horizontalSpace,
              Icon(
                Icons.circle,
                color: const Color.fromRGBO(150, 154, 160, 1),
                size: 4.04.w,
              ),
              8.horizontalSpace,
              Text(
                song.auditions,
                style: TextStyle(
                    color: const Color.fromRGBO(150, 154, 160, 1),
                    fontFamily: AppAssets.fontJakarta,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
