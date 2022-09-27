part of 'repository_imports.dart';

class CardRepository {
  Function swipeSaveEvent = () {};

  void event({
    required Emitter<SaveState> emit,
    required SaveEvent event,
  }) {
    event.isDislike
        ? event.isSave
            ? hiveRepository.saveFact(event.cardModel)
            : hiveRepository.removeFact(event.cardModel)
        : null;
    emit(
      SaveState(
        isSave: event.isSave,
      ),
    );
  }

  void saveEvent({
    required BuildContext context,
    required CardModel cardModel,
    bool isDislike = false,
    bool isSave = false,
  }) =>
      BlocProvider.of<SaveBloc>(context).add(
        SaveEvent(
          cardModel: cardModel,
          isDislike: isDislike,
          isSave: isSave,
        ),
      );

  void swipe(
    int index,
    AppinioSwiperDirection direction,
  ) {
    dev.log(
      AppStrings.swiped + direction.name,
    );
    swipeSaveEvent();
  }

  void unswipe(
    bool unswiped,
  ) {
    unswiped
        ? dev.log(
            AppStrings.success,
          )
        : dev.log(
            AppStrings.fail,
          );
  }

  Future<void> loadCards() async {
    for (CardModel catFact in factRepository.catFacts) {
      factRepository.cards.add(
        SwipeCard(
          catFact: catFact,
        ),
      );
    }
  }

  void showBar(
    BuildContext context,
    Pages page,
  ) {
    Navigator.of(context).pop();
    showBarModalBottomSheet(
      expand: true,
      context: context,
      backgroundColor: AppColors.color2,
      builder: (context) =>
          page == Pages.history ? const FactHistory() : const Settings(),
    );
  }
}

enum Pages {
  settings,
  history,
}
