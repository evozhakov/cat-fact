// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';


part 'image_model.g.dart';

@RestApi(baseUrl: "https://cataas.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/cat?json=true")
  Future<List<RandomImage>> getTasks();
}

@JsonSerializable()
class RandomImage {
  String? url;

  RandomImage({this.url,});

  factory RandomImage.fromJson(Map<String, dynamic> json) => _$RandomImageFromJson(json);
  Map<String, dynamic> toJson() => _$RandomImageToJson(this);
}

