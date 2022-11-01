import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/theme_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadFileWidget extends StatelessWidget {
  final Function function;
  final bool isNewSong;
  final AppLocalizations localizations;

  const UploadFileWidget({
    super.key,
    required this.localizations,
    this.isNewSong = true,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => function(),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          SvgPicture.asset(
            isNewSong ? AppAssets.coverNewSongs : AppAssets.coverBestSongs,
            fit: BoxFit.fitWidth,
            width: 327.w,
          ),
          SizedBox(
            height: 300.h,
            child: Column(
              children: [
                isNewSong ? 157.26.verticalSpace : 123.verticalSpace,
                Text(
                  isNewSong
                      ? localizations.addCoverArt
                      : localizations.uploadFile,
                  style: TextStyles.uploadFile,
                ),
                14.53.verticalSpace,
                if (!isNewSong)
                  SizedBox(
                    width: 240.w,
                    child: Text(
                      localizations.supportsStorages,
                      textAlign: TextAlign.center,
                      style: TextStyles.supportStor,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
