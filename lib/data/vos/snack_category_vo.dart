import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

part 'snack_category_vo.g.dart';

@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_SNACK_CATEGORY_VO,
    adapterName: 'SnackCategoryVOAdapter')
class SnackCategoryVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'title_mm')
  @HiveField(1)
  String? titleMm;

  @JsonKey(name: 'title')
  @HiveField(2)
  String? title;

  @JsonKey(name: 'is_active')
  @HiveField(3)
  int? isActive;

  @JsonKey(name: 'createdAt')
  @HiveField(4)
  DateTime? createdAt;

  @JsonKey(name: 'updatedAt')
  @HiveField(5)
  DateTime? updatedAt;

  @JsonKey(name: 'deletedAt')
  @HiveField(6)
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
