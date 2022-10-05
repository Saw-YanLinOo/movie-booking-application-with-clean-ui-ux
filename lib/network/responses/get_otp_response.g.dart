// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOtpResponse _$GetOtpResponseFromJson(Map<String, dynamic> json) =>
    GetOtpResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetOtpResponseToJson(GetOtpResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };
