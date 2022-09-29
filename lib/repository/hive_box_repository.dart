part of 'repository_imports.dart';

class HiveRepository {
  final Box<SavedHistory> _box = Hive.box<SavedHistory>('history');

  Future<void> saveFact(FactModel fact) async {
    SavedHistory save = SavedHistory(
      date: fact.date,
      fact: fact.fact,
      id: fact.id,
    );

    !isContains(fact)
        ? _box.put(
            fact.id,
            save,
          )
        : null;
  }

  bool isContains(FactModel fact) {
    bool isContains = _box.values.any(
      (element) => element.id.contains(
        fact.id,
      ),
    );
    return isContains;
  }

  void clearBox() {
    _box.clear();
  }

  List<SavedHistory> history() {
    Hive.openBox<SavedHistory>('history');
    List<SavedHistory> factHistory = _box.values.toList();
    return factHistory;
  }

  void removeFact(FactModel fact) {
    _box.delete(
      fact.id,
    );
  }
}
