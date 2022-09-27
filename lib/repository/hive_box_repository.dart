part of 'repository_imports.dart';

class HiveRepository {
  Box<SavedHistory> box = Hive.box<SavedHistory>(
    HiveBox.history.toString(),
  );

  Future<void> saveFact(CardModel fact) async {
    SavedHistory save = SavedHistory(
      date: fact.date,
      fact: fact.fact,
      id: fact.id,
    );
    bool isContains = box.values.any(
      (element) => element.id.toString().contains(
            fact.id.toString(),
          ),
    );

    !isContains
        ? box.put(
            fact.id,
            save,
          )
        : null;
  }

  void clearBox() {
    box.clear();
    cardRrepository.swipeSaveEvent();
  }

  List<SavedHistory> history() {
    Hive.openBox<SavedHistory>(
      HiveBox.history.toString(),
    );
    List<SavedHistory> factHistory = box.values.toList();
    return factHistory;
  }

  void removeFact(CardModel fact) {
    box.delete(
      fact.id,
    );
  }
}

enum HiveBox {
  history,
}
