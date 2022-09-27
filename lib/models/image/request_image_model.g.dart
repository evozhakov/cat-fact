// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomImage _$RandomImageFromJson(Map<String, dynamic> json) => RandomImage(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$RandomImageToJson(RandomImage instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestImage implements RestImage {
  _RestImage(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://cataas.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RandomImage> getImage() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<RandomImage>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/cat?json=true',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RandomImage.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
