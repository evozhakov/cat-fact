import 'package:hive/hive.dart';
part 'box_history.g.dart';

@HiveType(typeId: 1)
class SavedHistory{
  SavedHistory({
    required this.date,
    required this.fact
  });
  @HiveField(0)
  String date;
  @HiveField(1)
  String fact;



}