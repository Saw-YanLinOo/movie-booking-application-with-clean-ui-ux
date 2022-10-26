// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateVOAdapter extends TypeAdapter<DateVO> {
  @override
  final int typeId = 9;

  @override
  DateVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateVO(
      maximum: fields[0] as String?,
      minimum: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DateVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.maximum)
      ..writeByte(1)
      ..write(obj.minimum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateVO _$DateVOFromJson(Map<String, dynamic> json) => DateVO(
      maximum: json['maximum'] as String?,
      minimum: json['minimum'] as String?,
    );

Map<String, dynamic> _$DateVOToJson(DateVO instance) => <String, dynamic>{
      'maximum': instance.maximum,
      'minimum': instance.minimum,
    };
