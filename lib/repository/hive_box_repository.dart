import 'package:cats_fact/models/fact/get_fact_model.dart';
import 'package:cats_fact/models/history/box_history.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveRepository {
  Box<SavedHistory> box = Hive.box<SavedHistory>('history');
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
        ? box.add(
            save,
          )
        : null;
  }

  List<SavedHistory> history() {
    Hive.openBox<SavedHistory>('history');
    List<SavedHistory> factHistory = box.values.toList();
    return factHistory;
  }
}
