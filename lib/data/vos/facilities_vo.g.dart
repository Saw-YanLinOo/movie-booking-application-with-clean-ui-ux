// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facilities_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FacilitiesVOAdapter extends TypeAdapter<FacilitiesVO> {
  @override
  final int typeId = 10;

  @override
  FacilitiesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FacilitiesVO(
      id: fields[0] as int?,
      title: fields[1] as String?,
      img: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FacilitiesVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.img);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FacilitiesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FacilitiesVO _$FacilitiesVOFromJson(Map<String, dynamic> json) => FacilitiesVO(
      id: json['id'] as int?,
      title: json['title'] as String?,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$FacilitiesVOToJson(FacilitiesVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'img': instance.img,
    };
