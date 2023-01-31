part of 'repository_imports.dart';

class CardRepository {
  void swipe(int index, AppinioSwiperDirection direction) =>
      dev.log(AppStrings.swiped + direction.name);

  void unswipe(bool unswiped) =>
      unswiped ? dev.log(AppStrings.success) : dev.log(AppStrings.fail);

  void shareFact(FactModel fact) {
    Share.share('${fact.fact} ${fact.image}');
  }

  Future<void> loadCards(bool isFirs) async {
    for (FactModel catFact in factRepository.catFacts) {
      factRepository.cards.add(
        SwipeCard(catFact: catFact),
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
}
