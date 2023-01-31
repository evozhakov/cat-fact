import 'package:cats_fact/models/fact/fact_model.dart';
import 'package:hive/hive.dart';

part 'box_history.g.dart';

@HiveType(typeId: 1)
class SavedHistory {
  SavedHistory({required this.date, required this.fact, required this.id});
  @HiveField(0)
  String date;
  @HiveField(1)
  String fact;
  @HiveField(2)
  String id;

  factory SavedHistory.fromFact(FactModel fact) => SavedHistory(
        id: fact.id,
        date: fact.date,
        fact: fact.fact,
      );
}
