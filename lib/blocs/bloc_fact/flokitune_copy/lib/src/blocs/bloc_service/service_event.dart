part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent {}

class SwithMintEvent extends ServiceEvent {
  final bool svithValue;
  SwithMintEvent({required this.svithValue});
}

class SwithSplitEvent extends ServiceEvent {
  final bool svithValue;
  SwithSplitEvent({required this.svithValue});
}

class CheckBoxEvent extends ServiceEvent {
  final bool checkBoxValue;
  CheckBoxEvent({required this.checkBoxValue});
}

class ChangeDateEvent extends ServiceEvent {
  final DateTime date;
  ChangeDateEvent({
    required this.date,
  });
}

class ResetEvent extends ServiceEvent {}
