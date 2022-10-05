// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerVO _$BannerVOFromJson(Map<String, dynamic> json) => BannerVO(
      id: json['id'] as int?,
      name: json['title'] as String?,
      url: json['url'] as String?,
      isActive: json['is_active'] as int?,
      createAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$BannerVOToJson(BannerVO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'url': instance.url,
      'is_active': instance.isActive,
      'created_at': instance.createAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
