// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spoken_language_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SpokenLanguageVOAdapter extends TypeAdapter<SpokenLanguageVO> {
  @override
  final int typeId = 18;

  @override
  SpokenLanguageVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SpokenLanguageVO(
      englishName: fields[0] as String?,
      iso6391: fields[1] as String?,
      name: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SpokenLanguageVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.englishName)
      ..writeByte(1)
      ..write(obj.iso6391)
      ..writeByte(2)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SpokenLanguageVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpokenLanguageVO _$SpokenLanguageVOFromJson(Map<String, dynamic> json) =>
    SpokenLanguageVO(
      englishName: json['english_name'] as String?,
      iso6391: json['iso_639_1'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SpokenLanguageVOToJson(SpokenLanguageVO instance) =>
    <String, dynamic>{
      'english_name': instance.englishName,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
    };
