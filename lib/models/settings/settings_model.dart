import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 0)
class SettingsModel {
  @HiveField(0)
  final int countFact;
  @HiveField(1)
  final String locale;
  const SettingsModel({
    this.countFact = 5,
    this.locale = 'en',
  });
  factory SettingsModel.copyWith(
    SettingsModel state, {
    int? countFact,
    String? locale,
  }) =>
      SettingsModel(
        countFact: countFact ?? state.countFact,
        locale: locale ?? state.locale,
      );
}
