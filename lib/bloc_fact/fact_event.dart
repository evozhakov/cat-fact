part of 'fact_bloc.dart';

@immutable
abstract class FactEvent {}

class FirstEvent extends FactEvent {}

class MoreEvent extends FactEvent {}
