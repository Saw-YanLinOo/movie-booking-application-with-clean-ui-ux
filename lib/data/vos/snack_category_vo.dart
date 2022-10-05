import 'package:json_annotation/json_annotation.dart';

part 'snack_category_vo.g.dart';

@JsonSerializable()
class SnackCategoryVO {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'title_mm')
  String? titleMm;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'createdAt')
  DateTime? createdAt;
  @JsonKey(name: 'updatedAt')
  DateTime? updatedAt;
  @JsonKey(name: 'deletedAt')
  DateTime? deletedAt;

  SnackCategoryVO({
    this.id,
    this.title,
    this.titleMm,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory SnackCategoryVO.fromJson(Map<String, dynamic> json) =>
      _$SnackCategoryVOFromJson(json);

  Map<String, dynamic> toJson() => _$SnackCategoryVOToJson(this);
}
