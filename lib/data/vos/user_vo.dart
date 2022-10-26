// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

part 'user_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_USER_VO, adapterName: 'UserVOAdapter')
class UserVo {
  @JsonKey(name: 'id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'name')
  @HiveField(1)
  String? name;

  @JsonKey(name: 'email')
  @HiveField(2)
  String? email;

  @JsonKey(name: 'phone')
  @HiveField(3)
  String? phone;

  @JsonKey(name: 'total_expense')
  @HiveField(4)
  int? totalExpense;

  @JsonKey(name: 'profile_image')
  @HiveField(5)
  String? profileImage;

  @HiveField(6)
  String? token;

  UserVo({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.totalExpense,
    this.profileImage,
    this.token,
  });

  factory UserVo.fromJson(Map<String, dynamic> json) => _$UserVoFromJson(json);

  Map<String, dynamic> toJson() => _$UserVoToJson(this);
}
