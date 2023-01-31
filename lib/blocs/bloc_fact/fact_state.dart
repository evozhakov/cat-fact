part of 'fact_bloc.dart';

@immutable
class FactState {
  final List<SwipeCard> swipeCard;
  final List<SwipeCard> firstSwipeCard;
  final bool animation;
  const FactState({
    this.firstSwipeCard = const [],
    this.swipeCard = const [],
    this.animation = false,
  });
}
