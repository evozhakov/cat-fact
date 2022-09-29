part of 'fact_bloc.dart';

@immutable
class FactState {
  final List<SwipeCard> swipeCard;
  final List<SwipeCard> firstSwipeCard;
  final bool isSave;
  final bool animation;
  const FactState({
    this.isSave = true,
    this.firstSwipeCard = const [],
    this.swipeCard = const [],
    this.animation = false,
  });
}
