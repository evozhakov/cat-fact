part of 'repository_imports.dart';

class HiveFactRepository {
  final Box<SavedHistory> _box = Hive.box<SavedHistory>('history');

  ValueListenable<Box<SavedHistory>> get boxHistory => _box.listenable();

  void onTapIconSave(FactModel fact, bool isContains) {
    if (isContains) {
      _box.delete(
        fact.id,
      );
    } else {
      final history = SavedHistory.fromFact(fact);

      _box.put(
        fact.id,
        history,
      );
    }
  }

  void removeFact(SavedHistory history, AppLocalizations text) {
    _box.delete(
      history.id,
    );
    Utils.showSnackBar(
      text.factDeleted,
      labelButton: text.cancel,
      onTap: () {
        _box.put(history.id, history);
      },
    );
  }

  void clearBox(AppLocalizations text) {
    final values = _box.values.toList();
    if (values.isEmpty) {
      Utils.showSnackBar(text.noFacts);
    } else {
      _box.clear();

      Utils.showSnackBar(
        text.factsRemoved,
        labelButton: text.cancel,
        onTap: () {
          for (SavedHistory history in values) {
            _box.put(history.id, history);
          }
        },
      );
    }
  }
}
