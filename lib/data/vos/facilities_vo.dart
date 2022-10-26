import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

part 'facilities_vo.g.dart';

@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_FACILITIES_VO, adapterName: 'FacilitiesVOAdapter')
class FacilitiesVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'title')
  @HiveField(1)
  String? title;

  @JsonKey(name: 'img')
  @HiveField(2)
  String? img;

  FacilitiesVO({
    this.id,
    this.title,
    this.img,
  });

  factory FacilitiesVO.fromJson(Map<String, dynamic> json) =>
      _$FacilitiesVOFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitiesVOToJson(this);
}
