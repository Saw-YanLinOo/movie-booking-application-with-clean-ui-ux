import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app_view_layer/data/vos/snack_vo.dart';

part 'snack_list_response.g.dart';

@JsonSerializable()
class SnackListResponse {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<SnackVO>? data;

  SnackListResponse({
    this.code,
    this.message,
    this.data,
  });

  factory SnackListResponse.fromJson(Map<String, dynamic> json) =>
      _$SnackListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SnackListResponseToJson(this);
}
