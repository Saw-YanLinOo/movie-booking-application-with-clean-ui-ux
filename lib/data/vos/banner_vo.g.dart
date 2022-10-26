// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BannerVOAdapter extends TypeAdapter<BannerVO> {
  @override
  final int typeId = 1;

  @override
  BannerVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BannerVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
      url: fields[2] as String?,
      isActive: fields[3] as int?,
      createAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, BannerVO obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.isActive)
      ..writeByte(4)
      ..write(obj.createAt)
      ..writeByte(5)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BannerVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
