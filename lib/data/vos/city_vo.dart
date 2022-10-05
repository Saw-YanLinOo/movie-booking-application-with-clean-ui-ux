// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';
part 'city_vo.g.dart';

@JsonSerializable()
class CityVO {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'created_at')
  DateTime? createAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  CityVO({
    this.id,
    this.name,
    this.createAt,
    this.updatedAt,
  });
  factory CityVO.fromJson(Map<String, dynamic> json) => _$CityVOFromJson(json);

  Map<String, dynamic> toJson() => _$CityVOToJson(this);
}

// {
//             "id": 1,
//             "name": "Yangon",
//             "created_at": "2022-09-16T18:18:29.000000Z",
//             "updated_at": "2022-09-16T18:18:29.000000Z"
//         }
