// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'credit_vo.g.dart';

@JsonSerializable()
class CreditVO {
  @JsonKey(name: "adult")
  bool? adult;

  @JsonKey(name: "gender")
  int? gender;

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "known_for_department")
  String? konwnForDepartment;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "original_name")
  String? originalName;

  @JsonKey(name: "profile_path")
  String? profilePath;

  @JsonKey(name: "cast_id")
  int? castId;

  @JsonKey(name: "character")
  String? character;

  @JsonKey(name: "credit_id")
  String? creditId;

  @JsonKey(name: "order")
  int? order;
  CreditVO({
    this.adult,
    this.gender,
    this.id,
    this.konwnForDepartment,
    this.name,
    this.originalName,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory CreditVO.fromJson(Map<String, dynamic> json) =>
      _$CreditVOFromJson(json);

  Map<String, dynamic> toJson() => _$CreditVOToJson(this);

  bool isActor() {
    return konwnForDepartment == KNOWNFORDEPARTMENT;
  }

  bool isCreator() {
    return konwnForDepartment != KNOWNFORDEPARTMENT;
  }
}

const String KNOWNFORDEPARTMENT = 'Acting';
// {
//                 "adult": false,
//                 "gender": 2,
//                 "id": 1256603,
//                 "known_for_department": "Acting",
//                 "name": "Natsuki Hanae",
//                 "original_name": "Natsuki Hanae",
//                 "popularity": 23.179,
//                 "profile_path": "/A1lGrpBEdAUxZA7RoAw4Zr4ved3.jpg",
//                 "cast_id": 3,
//                 "character": "Tanjirō Kamado (voice)",
//                 "credit_id": "5d911fbb109cd000214543f4",
//                 "order": 0
//             }