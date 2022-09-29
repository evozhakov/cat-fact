import 'package:hive/hive.dart';

part 'box_history.g.dart';

@HiveType(typeId: 1)
class SavedHistory{
  SavedHistory({
    required this.date,
    required this.fact,
    required this.id
  });
  @HiveField(0)
  String date;
  @HiveField(1)
  String fact;
  @HiveField(2)
  String id;



}