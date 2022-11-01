part of 'service_bloc.dart';

@immutable
class ServiceState {
  final AppLocalizations localizations;
  final bool switchValueMint;
  final bool switchValueSplit;
  final DateTime? date;
  final bool iAgree;

  const ServiceState({
    required this.localizations,
    this.date,
    this.switchValueMint = false,
    this.switchValueSplit = false,
    this.iAgree = false,
  });

  String get dateInFormat => DateFormat.yMMMMd(localizations.localeName).format(
        date ?? DateTime.now(),
      );
}
