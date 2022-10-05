// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_category_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackCategoryListResponse _$SnackCategoryListResponseFromJson(
        Map<String, dynamic> json) =>
    SnackCategoryListResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SnackCategoryVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SnackCategoryListResponseToJson(
        SnackCategoryListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
