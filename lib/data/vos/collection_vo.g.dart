// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CollectionVOAdapter extends TypeAdapter<CollectionVO> {
  @override
  final int typeId = 6;

  @override
  CollectionVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CollectionVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
      backDropPath: fields[3] as String?,
    )..posterPath = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, CollectionVO obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.backDropPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionVO _$CollectionVOFromJson(Map<String, dynamic> json) => CollectionVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      backDropPath: json['backdrop_path'] as String?,
    )..posterPath = json['poster_path'] as String?;

Map<String, dynamic> _$CollectionVOToJson(CollectionVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backDropPath,
    };
