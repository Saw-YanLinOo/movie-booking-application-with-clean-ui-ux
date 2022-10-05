import 'package:json_annotation/json_annotation.dart';

part 'banner_vo.g.dart';

@JsonSerializable()
class BannerVO {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'title')
  String? name;

  @JsonKey(name: 'url')
  String? url;

  @JsonKey(name: 'is_active')
  int? isActive;

  @JsonKey(name: 'created_at')
  DateTime? createAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  BannerVO({
    this.id,
    this.name,
    this.url,
    this.isActive,
    this.createAt,
    this.updatedAt,
  });

  factory BannerVO.fromJson(Map<String, dynamic> json) =>
      _$BannerVOFromJson(json);

  Map<String, dynamic> toJson() => _$BannerVOToJson(this);
}