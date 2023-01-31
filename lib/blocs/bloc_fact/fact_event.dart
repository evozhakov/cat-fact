part of 'fact_bloc.dart';

@immutable
abstract class FactEvent {}

class FirstLoadEvent extends FactEvent {}

class MoreLoadEvent extends FactEvent {}
