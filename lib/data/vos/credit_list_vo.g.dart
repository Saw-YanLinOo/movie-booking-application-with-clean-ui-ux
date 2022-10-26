// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_list_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreditListVOAdapter extends TypeAdapter<CreditListVO> {
  @override
  final int typeId = 22;

  @override
  CreditListVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreditListVO(
      creditList: (fields[0] as List?)?.cast<CreditVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, CreditListVO obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.creditList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreditListVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
