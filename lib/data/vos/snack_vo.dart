import 'package:json_annotation/json_annotation.dart';

part 'snack_vo.g.dart';

@JsonSerializable()
class SnackVO {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'category_id')
  int? categoryId;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'quantity')
  int? quantity;

  SnackVO({
    this.id,
    this.name,
    this.description,
    this.price,
    this.categoryId,
    this.image,
  });
  factory SnackVO.fromJson(Map<String, dynamic> json) =>
      _$SnackVOFromJson(json);

  Map<String, dynamic> toJson() => _$SnackVOToJson(this);
}
