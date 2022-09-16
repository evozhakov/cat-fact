// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'fact_model.g.dart';

@RestApi(baseUrl: "https://catfact.ninja")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/fact")
  Future<List<RandomFact>> getTasks();
}

@JsonSerializable()
class RandomFact {
  String? fact;
  int? length;
 

  RandomFact({this.fact, this.length, });

  factory RandomFact.fromJson(Map<String, dynamic> json) => _$RandomFactFromJson(json);
  Map<String, dynamic> toJson() => _$RandomFactToJson(this);
}