// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutResponse _$CheckOutResponseFromJson(Map<String, dynamic> json) =>
    CheckOutResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CheckOutVO.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckOutResponseToJson(CheckOutResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
