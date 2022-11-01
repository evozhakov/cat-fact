part of 'navigation_bloc.dart';

@immutable
class NavigationState {
  final Pages page;
  final Widget pageContent;
  final bool botomNavigatorBarIsVisible;
  final Pages previousPage;
  final bool shouldPop;
  const NavigationState({
    this.shouldPop = false,
    this.page = Pages.myStudio,
    this.pageContent = const MyStudio(),
    this.botomNavigatorBarIsVisible = true,
    this.previousPage = Pages.myStudio,
  });
  bool get platform => Platform.isIOS;
}

enum Pages {
  myStudio,
  songs,
  marketplace,
  profile,
  newSongs,
  myBestSongs,
  addService,
  musicPlaying,
}
