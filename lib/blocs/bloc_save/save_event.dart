part of 'save_bloc.dart';

@immutable
class SaveEvent {
  final CardModel cardModel;
  final bool isSave;
  final bool isDislike;
  const SaveEvent({
    required this.cardModel,
    this.isSave = false,
    required this.isDislike,
  });
}
