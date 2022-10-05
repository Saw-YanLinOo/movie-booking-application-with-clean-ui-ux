import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app_view_layer/data/vos/city_vo.dart';

part 'city_list_response.g.dart';

@JsonSerializable()
class CityListResponse {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<CityVO>? data;
  CityListResponse({
    this.code,
    this.message,
    this.data,
  });

  factory CityListResponse.fromJson(Map<String, dynamic> json) =>
      _$CityListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityListResponseToJson(this);
}
