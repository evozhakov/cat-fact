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

class ChangeLanguageEvent extends ServiceEvent {
  final String locale;
  ChangeLanguageEvent(this.locale);
}

class CataasNotWorkEvent extends ServiceEvent {}
