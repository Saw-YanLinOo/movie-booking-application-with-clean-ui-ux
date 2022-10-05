// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'user_vo.g.dart';

@JsonSerializable()
class UserVo {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'total_expense')
  int? totalExpense;

  @JsonKey(name: 'profile_image')
  String? profileImage;

  UserVo({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.totalExpense,
    this.profileImage,
  });

  factory UserVo.fromJson(Map<String, dynamic> json) => _$UserVoFromJson(json);

  Map<String, dynamic> toJson() => _$UserVoToJson(this);
}
