// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackListResponse _$SnackListResponseFromJson(Map<String, dynamic> json) =>
    SnackListResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SnackVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SnackListResponseToJson(SnackListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
