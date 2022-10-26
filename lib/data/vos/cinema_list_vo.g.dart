// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_list_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CinemaListVOAdapter extends TypeAdapter<CinemaListVO> {
  @override
  final int typeId = 21;

  @override
  CinemaListVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CinemaListVO(
      cinemaList: (fields[0] as List?)?.cast<CinemaVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, CinemaListVO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.cinemaList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CinemaListVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
