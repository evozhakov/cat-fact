part of 'repository_imports.dart';

class CardRepository {
  void swipe(
    int index,
    AppinioSwiperDirection direction,
  ) {
    dev.log(
      AppStrings.swiped + direction.name,
    );
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

  Future<void> loadCards(
    bool isFirs,
  ) async {
    for (FactModel catFact in factRepository.catFacts) {
      factRepository.cards.add(
        SwipeCard(
          catFact: catFact,
        ),
      );
    }
    if (isFirs) {
      for (FactModel catFact in factRepository.emptyFact) {
        factRepository.firstCard.add(
          SwipeCard(
            catFact: catFact,
          ),
        );
      }
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
      builder: (BuildContext context) =>
          page == Pages.history ? const FactHistory() : const Settings(),
    );
  }

  void save({
    required FactState state,
    required Emitter<FactState> emit,
    required SaveFactEvent event,
  }) {
    !hiveRepository.isContains(event.fact)
        ? hiveRepository.saveFact(event.fact)
        : hiveRepository.removeFact(event.fact);
    emit(
      FactState(
        swipeCard: state.swipeCard,
        isSave: !state.isSave,
      ),
    );
  }
}

enum Pages {
  settings,
  history,
}
