import 'package:flokitune/src/blocs/bloc_navigation/navigation_bloc.dart';
import 'package:flokitune/src/ui/add_service/add_service.dart';
import 'package:flokitune/src/ui/marketplace/marketplace.dart';
import 'package:flokitune/src/ui/music_playing/music_playing.dart';
import 'package:flokitune/src/ui/my_best_song/my_best_song.dart';
import 'package:flokitune/src/ui/new_song/new_song.dart';
import 'package:flokitune/src/ui/profile/account_page.dart';
import 'package:flokitune/src/ui/songs/songs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

mixin NavigationRepository {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genreController = TextEditingController();

  void navigation({
    required Pages page,
    required Emitter<NavigationState> emit,
    required AppLocalizations localizations,
    required NavigationState state,
  }) {
    switch (page) {
      case Pages.myStudio:
        emit(
          NavigationState(
            shouldPop: true,
            previousPage: state.page,
          ),
        );
        break;
      case Pages.marketplace:
        emit(
          NavigationState(
            shouldPop: true,
            pageContent: const Marketplace(),
            page: Pages.marketplace,
            previousPage: state.page,
          ),
        );
        break;
      case Pages.songs:
        emit(
          NavigationState(
            shouldPop: true,
            pageContent: const Songs(),
            page: Pages.songs,
            previousPage: state.page,
          ),
        );
        break;
      case Pages.profile:
        emit(
          NavigationState(
            pageContent: const AccountPage(),
            page: Pages.profile,
            previousPage: state.page,
            botomNavigatorBarIsVisible: false,
          ),
        );
        break;
      case Pages.newSongs:
        emit(
          NavigationState(
            pageContent: NewSong(
              nameController: nameController,
              genreController: genreController,
            ),
            page: Pages.newSongs,
            previousPage: Pages.myStudio,
            botomNavigatorBarIsVisible: false,
          ),
        );
        break;
      case Pages.myBestSongs:
        emit(
          NavigationState(
            pageContent: MyBestSong(
              nameSong: nameController.text.trim(),
              functionClaer: () {
                nameController.clear();
                genreController.clear();
              },
            ),
            page: Pages.myBestSongs,
            previousPage: Pages.newSongs,
            botomNavigatorBarIsVisible: false,
          ),
        );
        break;
      case Pages.addService:
        emit(
          NavigationState(
            pageContent: const AddService(),
            page: Pages.marketplace,
            previousPage: state.page,
            botomNavigatorBarIsVisible: false,
          ),
        );
        break;
      case Pages.musicPlaying:
        emit(
          NavigationState(
            shouldPop: true,
            pageContent: const MusicPlaying(),
            page: Pages.musicPlaying,
            previousPage: state.page,
          ),
        );
        break;
    }
  }
}
