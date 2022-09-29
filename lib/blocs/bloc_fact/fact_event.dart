part of 'fact_bloc.dart';

@immutable
abstract class FactEvent {}

class FirstLoadEvent extends FactEvent {}

class MoreLoadEvent extends FactEvent {}

class SaveFactEvent extends FactEvent {
  final FactModel fact;

  SaveFactEvent({
    this.fact = const FactModel(),
  });
}
