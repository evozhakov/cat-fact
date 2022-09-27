import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'package:cats_fact/constants/app_strings.dart';

part 'request_fact_model.g.dart';

@RestApi(baseUrl: AppStrings.baseUrlFact)
abstract class RestFact {
  factory RestFact(Dio dio, {String baseUrl}) = _RestFact;

  @GET("/fact")
  Future<RandomFact> getFact();
}

@JsonSerializable()
class RandomFact {
  String? fact;
  int? length;

  RandomFact({
    this.fact,
    this.length,
  });

  factory RandomFact.fromJson(Map<String, dynamic> json) =>
      _$RandomFactFromJson(json);
  Map<String, dynamic> toJson() => _$RandomFactToJson(this);
}
