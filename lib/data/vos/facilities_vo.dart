import 'package:json_annotation/json_annotation.dart';

part 'facilities_vo.g.dart';

@JsonSerializable()
class FacilitiesVO {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'img')
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
