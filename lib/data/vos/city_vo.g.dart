// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CityVOAdapter extends TypeAdapter<CityVO> {
  @override
  final int typeId = 5;

  @override
  CityVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CityVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
      createAt: fields[2] as DateTime?,
      updatedAt: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, CityVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.createAt)
      ..writeByte(3)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CityVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
