import 'package:json_annotation/json_annotation.dart';

part 'config_vo.g.dart';

@JsonSerializable()
class ConfigVO {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'key')
  String? key;

  @JsonKey(name: 'value')
  dynamic value;

  ConfigVO({
    this.id,
    this.key,
    required this.value,
  });
  factory ConfigVO.fromJson(Map<String, dynamic> json) =>
      _$ConfigVOFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigVOToJson(this);
}

// {
//             "id": 1,
//             "key": "cinema_updated_time",
//             "value": "2022-09-23 17:19:51"
//         }