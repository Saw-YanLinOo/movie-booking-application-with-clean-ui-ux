// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConfigResponse _$GetConfigResponseFromJson(Map<String, dynamic> json) =>
    GetConfigResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ConfigVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetConfigResponseToJson(GetConfigResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
