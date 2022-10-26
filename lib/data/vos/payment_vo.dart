import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

part 'payment_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_PAYMENT_VO, adapterName: 'PaymentVOAdapter')
class PaymentVO {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'title')
  @HiveField(1)
  String? title;

  @JsonKey(name: 'icon')
  @HiveField(2)
  String? icon;

  @JsonKey(name: 'created_at')
  @HiveField(3)
  DateTime? createAt;

  @JsonKey(name: 'updated_at')
  @HiveField(4)
  DateTime? updatedAt;

  @JsonKey(name: 'deleted_at')
  @HiveField(5)
  DateTime? deletedAt;

  PaymentVO(
      {this.id,
      this.title,
      this.icon,
      this.createAt,
      this.updatedAt,
      this.deletedAt});

  factory PaymentVO.fromJson(Map<String, dynamic> json) =>
      _$PaymentVOFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentVOToJson(this);
}
