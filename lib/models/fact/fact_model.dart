import 'package:cats_fact/constants/app_strings.dart';
import 'package:json_annotation/json_annotation.dart';
part 'fact_model.g.dart';

@JsonSerializable()
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

  factory FactModel.fromJson(Map<String, dynamic> json) =>
      _$FactModelFromJson(json);

  Map<String, dynamic> toJson() => _$FactModelToJson(this);
}
