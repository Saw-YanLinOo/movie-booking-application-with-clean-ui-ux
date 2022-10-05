// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInWithPhoneResponse _$SignInWithPhoneResponseFromJson(
        Map<String, dynamic> json) =>
    SignInWithPhoneResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      userVo: json['data'] == null
          ? null
          : UserVo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInWithPhoneResponseToJson(
        SignInWithPhoneResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'token': instance.token,
      'data': instance.userVo,
    };
