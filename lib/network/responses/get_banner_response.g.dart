// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_banner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBannerResponse _$GetBannerResponseFromJson(Map<String, dynamic> json) =>
    GetBannerResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BannerVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetBannerResponseToJson(GetBannerResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
