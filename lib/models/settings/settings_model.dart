import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 0)
class SettingsModel {
  @HiveField(0)
  final int countFact;
  const SettingsModel({
    this.countFact = 5,
  });
  factory SettingsModel.copyWith(
    SettingsModel state, {
    int? countFact,
  }) =>
      SettingsModel(
        countFact: countFact ?? state.countFact,
      );
}
