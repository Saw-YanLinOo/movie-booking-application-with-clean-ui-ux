// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckOutVOAdapter extends TypeAdapter<CheckOutVO> {
  @override
  final int typeId = 2;

  @override
  CheckOutVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckOutVO(
      id: fields[0] as int?,
      bookingNo: fields[1] as String?,
      bookingDate: fields[2] as String?,
      row: fields[3] as String?,
      seat: fields[4] as String?,
      totalSeat: fields[5] as int?,
      total: fields[6] as String?,
      movieId: fields[7] as int?,
      cinemaId: fields[8] as int?,
      userName: fields[9] as String?,
      timeSlot: fields[10] as TimeSlotVO?,
      snackList: (fields[11] as List?)?.cast<SnackVO>(),
      qrCode: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CheckOutVO obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.bookingNo)
      ..writeByte(2)
      ..write(obj.bookingDate)
      ..writeByte(3)
      ..write(obj.row)
      ..writeByte(4)
      ..write(obj.seat)
      ..writeByte(5)
      ..write(obj.totalSeat)
      ..writeByte(6)
      ..write(obj.total)
      ..writeByte(7)
      ..write(obj.movieId)
      ..writeByte(8)
      ..write(obj.cinemaId)
      ..writeByte(9)
      ..write(obj.userName)
      ..writeByte(10)
      ..write(obj.timeSlot)
      ..writeByte(11)
      ..write(obj.snackList)
      ..writeByte(12)
      ..write(obj.qrCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckOutVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutVO _$CheckOutVOFromJson(Map<String, dynamic> json) => CheckOutVO(
      id: json['id'] as int?,
      bookingNo: json['booking_no'] as String?,
      bookingDate: json['booking_date'] as String?,
      row: json['row'] as String?,
      seat: json['seat'] as String?,
      totalSeat: json['total_seat'] as int?,
      total: json['total'] as String?,
      movieId: json['movie_id'] as int?,
      cinemaId: json['cinema_id'] as int?,
      userName: json['username'] as String?,
      timeSlot: json['timeslot'] == null
          ? null
          : TimeSlotVO.fromJson(json['timeslot'] as Map<String, dynamic>),
      snackList: (json['snacks'] as List<dynamic>?)
          ?.map((e) => SnackVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      qrCode: json['qr_code'] as String?,
    );

Map<String, dynamic> _$CheckOutVOToJson(CheckOutVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_no': instance.bookingNo,
      'booking_date': instance.bookingDate,
      'row': instance.row,
      'seat': instance.seat,
      'total_seat': instance.totalSeat,
      'total': instance.total,
      'movie_id': instance.movieId,
      'cinema_id': instance.cinemaId,
      'username': instance.userName,
      'timeslot': instance.timeSlot,
      'snacks': instance.snackList,
      'qr_code': instance.qrCode,
    };
