// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentVO _$PaymentVOFromJson(Map<String, dynamic> json) => PaymentVO(
      id: json['id'] as int?,
      title: json['title'] as String?,
      icon: json['icon'] as String?,
      createAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
    );

Map<String, dynamic> _$PaymentVOToJson(PaymentVO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
      'created_at': instance.createAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
    };
