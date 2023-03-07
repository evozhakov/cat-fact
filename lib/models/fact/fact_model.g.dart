// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactModel _$FactModelFromJson(Map<String, dynamic> json) => FactModel(
      date: json['date'] as String? ?? AppStrings.empty,
      image: json['image'] as String? ?? AppStrings.ulrCatFull,
      fact: json['fact'] as String? ?? AppStrings.empty,
      id: json['id'] as String? ?? AppStrings.empty,
    );

Map<String, dynamic> _$FactModelToJson(FactModel instance) => <String, dynamic>{
      'date': instance.date,
      'image': instance.image,
      'fact': instance.fact,
      'id': instance.id,
    };
