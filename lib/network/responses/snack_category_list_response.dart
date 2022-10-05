import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app_view_layer/data/vos/snack_category_vo.dart';

part 'snack_category_list_response.g.dart';

@JsonSerializable()
class SnackCategoryListResponse {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<SnackCategoryVO>? data;
  SnackCategoryListResponse({
    this.code,
    this.message,
    this.data,
  });

  factory SnackCategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$SnackCategoryListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SnackCategoryListResponseToJson(this);
}
