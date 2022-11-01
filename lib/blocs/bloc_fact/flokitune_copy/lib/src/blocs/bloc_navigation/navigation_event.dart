part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class NavigationNewPageEvent extends NavigationEvent {
  final Pages page;
  NavigationNewPageEvent({
    required this.page,
  });
}

class NavigationPeviousPageEvent extends NavigationEvent {}
