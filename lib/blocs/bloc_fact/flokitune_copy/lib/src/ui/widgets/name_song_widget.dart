import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flutter/material.dart';

class NameSongWidget extends StatelessWidget {
  final String songName;
  final double width;
  final double fontSize;
  final bool changeColor;

  const NameSongWidget({
    super.key,
    required this.width,
    required this.fontSize,
    required this.songName,
    this.changeColor = false,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return SizedBox(
      width: width,
      child: FadingEdgeScrollView.fromSingleChildScrollView(
        gradientFractionOnEnd: 0.7,
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: Text(
            songName,
            style: TextStyle(
              color: changeColor ? const Color.fromRGBO(217, 15, 72, 1) : null,
              fontSize: fontSize,
              fontFamily: AppAssets.fontJakarta,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
