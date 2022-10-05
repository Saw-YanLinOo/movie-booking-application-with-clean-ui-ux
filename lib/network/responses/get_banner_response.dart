import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/data/vos/banner_vo.dart';

part 'get_banner_response.g.dart';

@JsonSerializable()
class GetBannerResponse {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<BannerVO>? data;
  GetBannerResponse({
    this.code,
    this.message,
    this.data,
  });

  factory GetBannerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBannerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBannerResponseToJson(this);
}
