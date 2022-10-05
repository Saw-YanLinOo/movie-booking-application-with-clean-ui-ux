// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigVO _$ConfigVOFromJson(Map<String, dynamic> json) => ConfigVO(
      id: json['id'] as int?,
      key: json['key'] as String?,
      value: json['value'],
    );

Map<String, dynamic> _$ConfigVOToJson(ConfigVO instance) => <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'value': instance.value,
    };
