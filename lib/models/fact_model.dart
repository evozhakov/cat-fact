import 'package:cats_fact/constants/app_strings.dart';

class FactModel {
  final String date;
  final String image;
  final String fact;
  final String id;
  const FactModel({
    this.date = AppStrings.empty,
    this.image = AppStrings.ulrCatFull,
    this.fact = AppStrings.empty,
    this.id = AppStrings.empty,
  });
}
