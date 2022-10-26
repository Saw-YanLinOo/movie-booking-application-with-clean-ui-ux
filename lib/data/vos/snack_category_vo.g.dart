// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_category_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SnackCategoryVOAdapter extends TypeAdapter<SnackCategoryVO> {
  @override
  final int typeId = 16;

  @override
  SnackCategoryVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SnackCategoryVO(
      id: fields[0] as int?,
      title: fields[2] as String?,
      titleMm: fields[1] as String?,
      isActive: fields[3] as int?,
      createdAt: fields[4] as DateTime?,
      updatedAt: fields[5] as DateTime?,
      deletedAt: fields[6] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, SnackCategoryVO obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.titleMm)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.isActive)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.deletedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SnackCategoryVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackCategoryVO _$SnackCategoryVOFromJson(Map<String, dynamic> json) =>
    SnackCategoryVO(
      id: json['id'] as int?,
      title: json['title'] as String?,
      titleMm: json['title_mm'] as String?,
      isActive: json['is_active'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$SnackCategoryVOToJson(SnackCategoryVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title_mm': instance.titleMm,
      'title': instance.title,
      'is_active': instance.isActive,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
