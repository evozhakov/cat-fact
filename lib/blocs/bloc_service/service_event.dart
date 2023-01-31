part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent {}

class OpenCloseDrawerEvent extends ServiceEvent {
  final bool isOpen;
  OpenCloseDrawerEvent(this.isOpen);
}

class ChangeCountFactEvent extends ServiceEvent {
  final int value;
  ChangeCountFactEvent(this.value);
}
