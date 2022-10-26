// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CinemaVOAdapter extends TypeAdapter<CinemaVO> {
  @override
  final int typeId = 4;

  @override
  CinemaVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CinemaVO(
      id: fields[0] as int?,
      name: fields[1] as String?,
      phone: fields[2] as String?,
      email: fields[3] as String?,
      address: fields[4] as String?,
      promoVdoUrl: fields[5] as String?,
      facilities: (fields[6] as List?)?.cast<FacilitiesVO>(),
      safety: (fields[7] as List?)?.cast<String>(),
      selectDate: fields[12] as String?,
      cinemaId: fields[8] as int?,
      cinema: fields[9] as String?,
      timeSlotList: (fields[10] as List?)?.cast<TimeSlotVO>(),
      timeSlot: fields[11] as TimeSlotVO?,
    );
  }

  @override
  void write(BinaryWriter writer, CinemaVO obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.address)
      ..writeByte(5)
      ..write(obj.promoVdoUrl)
      ..writeByte(6)
      ..write(obj.facilities)
      ..writeByte(7)
      ..write(obj.safety)
      ..writeByte(8)
      ..write(obj.cinemaId)
      ..writeByte(9)
      ..write(obj.cinema)
      ..writeByte(10)
      ..write(obj.timeSlotList)
      ..writeByte(11)
      ..write(obj.timeSlot)
      ..writeByte(12)
      ..write(obj.selectDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CinemaVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaVO _$CinemaVOFromJson(Map<String, dynamic> json) => CinemaVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      promoVdoUrl: json['promo_vdo_url'] as String?,
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => FacilitiesVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      safety:
          (json['safety'] as List<dynamic>?)?.map((e) => e as String).toList(),
      selectDate: json['selectDate'] as String?,
      cinemaId: json['cinema_id'] as int?,
      cinema: json['cinema'] as String?,
      timeSlotList: (json['timeslots'] as List<dynamic>?)
          ?.map((e) => TimeSlotVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeSlot: json['timeSlot'] == null
          ? null
          : TimeSlotVO.fromJson(json['timeSlot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CinemaVOToJson(CinemaVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
      'promo_vdo_url': instance.promoVdoUrl,
      'facilities': instance.facilities,
      'safety': instance.safety,
      'cinema_id': instance.cinemaId,
      'cinema': instance.cinema,
      'timeslots': instance.timeSlotList,
      'timeSlot': instance.timeSlot,
      'selectDate': instance.selectDate,
    };
