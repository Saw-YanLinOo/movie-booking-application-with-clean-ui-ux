// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_slot_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeSlotVOAdapter extends TypeAdapter<TimeSlotVO> {
  @override
  final int typeId = 19;

  @override
  TimeSlotVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeSlotVO(
      id: fields[0] as int?,
      startTime: fields[1] as String?,
      status: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TimeSlotVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.startTime)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeSlotVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSlotVO _$TimeSlotVOFromJson(Map<String, dynamic> json) => TimeSlotVO(
      id: json['cinema_day_timeslot_id'] as int?,
      startTime: json['start_time'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$TimeSlotVOToJson(TimeSlotVO instance) =>
    <String, dynamic>{
      'cinema_day_timeslot_id': instance.id,
      'start_time': instance.startTime,
      'status': instance.status,
    };
