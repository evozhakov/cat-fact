import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'package:cats_fact/constants/app_strings.dart';

part 'image_model.g.dart';

@RestApi(baseUrl: AppStrings.baseUrlImage)
abstract class RestImage {
  factory RestImage(Dio dio, {String baseUrl}) = _RestImage;

  @GET("/cat?json=true")
  Future<RandomImage> getImage();
}

@JsonSerializable()
class RandomImage {
  String? url;

  RandomImage({
    this.url,
  });

  factory RandomImage.fromJson(Map<String, dynamic> json) =>
      _$RandomImageFromJson(json);
  Map<String, dynamic> toJson() => _$RandomImageToJson(this);
}
