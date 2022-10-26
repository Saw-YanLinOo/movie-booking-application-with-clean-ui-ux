// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

part 'credit_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_CREDIT_VO, adapterName: 'CreditVOAdapter')
class CreditVO {
  @JsonKey(name: "adult")
  @HiveField(0)
  bool? adult;

  @JsonKey(name: "gender")
  @HiveField(1)
  int? gender;

  @JsonKey(name: "id")
  @HiveField(2)
  int? id;

  @JsonKey(name: "known_for_department")
  @HiveField(3)
  String? konwnForDepartment;

  @JsonKey(name: "name")
  @HiveField(4)
  String? name;

  @JsonKey(name: "original_name")
  @HiveField(5)
  String? originalName;

  @JsonKey(name: "profile_path")
  @HiveField(6)
  String? profilePath;

  @JsonKey(name: "cast_id")
  @HiveField(7)
  int? castId;

  @JsonKey(name: "character")
  @HiveField(8)
  String? character;

  @JsonKey(name: "credit_id")
  @HiveField(9)
  String? creditId;

  @JsonKey(name: "order")
  @HiveField(10)
  int? order;

  @HiveField(11)
  int? movieId;

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
    this.movieId,
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