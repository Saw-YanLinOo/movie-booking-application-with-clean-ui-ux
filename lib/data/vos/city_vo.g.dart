// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityVO _$CityVOFromJson(Map<String, dynamic> json) => CityVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      createAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CityVOToJson(CityVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
