import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app_view_layer/data/vos/user_vo.dart';

part 'sign_in_with_phone_response.g.dart';

@JsonSerializable()
class SignInWithPhoneResponse {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'data')
  UserVo? userVo;

  SignInWithPhoneResponse({
    this.code,
    this.message,
    this.token,
    this.userVo,
  });

  factory SignInWithPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$SignInWithPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignInWithPhoneResponseToJson(this);
}
