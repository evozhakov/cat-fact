part of 'fact_bloc.dart';

@immutable

class FactState {
  final List<SwipeCard> swipeCard;
  const FactState({
    this.swipeCard = const [],
  });
}
