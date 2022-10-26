import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

part 'banner_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BANNER_VO, adapterName: 'BannerVOAdapter')
class BannerVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'title')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'url')
  @HiveField(2)
  String? url;

  @JsonKey(name: 'is_active')
  @HiveField(3)
  int? isActive;

  @JsonKey(name: 'created_at')
  @HiveField(4)
  DateTime? createAt;

  @JsonKey(name: 'updated_at')
  @HiveField(5)
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
