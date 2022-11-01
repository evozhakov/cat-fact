import 'dart:developer';

import 'package:flokitune/src/blocs/bloc_music_player/music_player_bloc.dart';
import 'package:flokitune/src/blocs/bloc_navigation/navigation_bloc.dart';
import 'package:flokitune/src/blocs/bloc_service/service_bloc.dart';
import 'package:flokitune/src/constants/app_assets.dart';
import 'package:flokitune/src/ui/music_player/music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GeneralScaffold extends StatelessWidget {
  const GeneralScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(context),
        ),
        BlocProvider<ServiceBloc>(
          create: (_) => ServiceBloc(context),
        ),
        BlocProvider<MusicPlayerBloc>(
          create: (_) => MusicPlayerBloc(),
        ),
      ],
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, navigationState) {
          return BlocBuilder<MusicPlayerBloc, MusicPlayerState>(
            builder: (context, playerState) {
              return WillPopScope(
                onWillPop: () async {
                  !navigationState.shouldPop
                      ? BlocProvider.of<NavigationBloc>(context).add(
                          NavigationPeviousPageEvent(),
                        )
                      : null;
                  return false;
                },
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(12, 27, 54, 1),
                  ),
                  child: SafeArea(
                    top: false,
                    bottom: navigationState.botomNavigatorBarIsVisible,
                    child: Scaffold(
                      bottomNavigationBar: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (playerState.isShowPlayer)
                            MusicPlayer(
                              navigationState: navigationState,
                              playerState: playerState,
                            ),
                          Container(
                            height: navigationState.botomNavigatorBarIsVisible
                                ? 74
                                : 0,
                            padding: EdgeInsets.only(
                              top: 16.h,
                              bottom: navigationState.platform ? 0.h : 18.h,
                              right: 39.w,
                              left: 39.w,
                            ),
                            color: const Color.fromRGBO(12, 27, 54, 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _iconButtonBottomBar(
                                    AppAssets.voiceSquare,
                                    Pages.myStudio,
                                    navigationState.page,
                                    context),
                                _iconButtonBottomBar(AppAssets.music,
                                    Pages.songs, navigationState.page, context),
                                InkWell(
                                  child: CircleAvatar(
                                    backgroundColor:
                                        const Color.fromRGBO(218, 21, 76, 1),
                                    radius: 20.r,
                                    child: Icon(
                                      Icons.add,
                                      size: 20.w,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                    ),
                                  ),
                                  onTap: () =>
                                      BlocProvider.of<NavigationBloc>(context)
                                          .add(NavigationNewPageEvent(
                                              page: Pages.marketplace)),
                                ),
                                _iconButtonBottomBar(
                                    AppAssets.musicLib,
                                    Pages.musicPlaying,
                                    navigationState.page,
                                    context),
                                _iconButtonBottomBar(
                                    AppAssets.profile,
                                    Pages.profile,
                                    navigationState.page,
                                    context),
                              ],
                            ),
                          ),
                        ],
                      ),
                      body: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: navigationState.pageContent,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _iconButtonBottomBar(
      String icon, Pages page, Pages pageee, BuildContext context) {
    return SizedBox.square(
      dimension: 24.h,
      child: InkWell(
        onTap: () =>
            BlocProvider.of<NavigationBloc>(context).add(NavigationNewPageEvent(
          page: page,
        )),
        child: SvgPicture.asset(
          icon,
          height: 24.h,
          color: page == pageee
              ? const Color.fromRGBO(219, 230, 254, 1)
              : const Color.fromRGBO(150, 154, 160, 1),
          width: 24.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

final PanelController panelController = PanelController();
