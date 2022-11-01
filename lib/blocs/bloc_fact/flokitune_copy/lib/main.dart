// import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/constants/behaivor.dart';
import 'package:flokitune/src/theme_styles/app_themedata.dart';
import 'package:flokitune/src/ui/general_scaffold.dart';
// import 'package:flokitune/src/ui/login/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const FlokiTune());
}

class FlokiTune extends StatelessWidget {
  const FlokiTune({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: (context, child1) {
            return ScrollConfiguration(
              behavior: CustomBehavior(),
              child: child1!,
            );
          },
          theme: AppThemeData.customThemeData,
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child:
          // const Auth(),
          const GeneralScaffold(),
    );
  }
}




//   Future.wait([
//     precachePicture(
//       ExactAssetPicture(
//           SvgPicture.svgStringDecoderBuilder, AppAssets.logoElements),
//       null,
//     ),
//     precachePicture(
//       ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, AppAssets.elements),
//       null,
//     ),
//     precachePicture(
//       ExactAssetPicture(
//           SvgPicture.svgStringDecoderBuilder, AppAssets.elementsOnboardingfull),
//       null,
//     ),
//   ]).whenComplete(
//     () => 
