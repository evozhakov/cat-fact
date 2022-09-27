import 'package:cats_fact/constants/app_strings.dart';

class CardModel {
  final String date;
  final String image;
  final String fact;
  final int id;
  const CardModel({
    this.date = AppStrings.empty,
    this.image = AppStrings.ulrCatFull,
    this.fact = AppStrings.empty,
    this.id = 1,
  });
}
