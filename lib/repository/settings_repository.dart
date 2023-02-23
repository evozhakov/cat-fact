part of 'repository_imports.dart';

class SettingsRepository {
  final _box = Hive.box<SettingsModel>('settings');
  void changeCountFact(BuildContext context, int count) {
    context.read<ServiceBloc>().add(ChangeCountFactEvent(count));
    if (_box.values.isNotEmpty) {
      final settings = _box.values.first;
      _box.clear();

      _box.add(SettingsModel.copyWith(settings, countFact: count));
    } else {
      _box.add(SettingsModel(countFact: count));
    }
  }
   void changeLanguage(BuildContext context, String locale) {
    context.read<ServiceBloc>().add(ChangeLanguageEvent(locale));
    if (_box.values.isNotEmpty) {
      final settings = _box.values.first;
      _box.clear();

      _box.add(SettingsModel.copyWith(settings, locale: locale));
    } else {
      _box.add(SettingsModel(locale: locale));
    }
  }
}
