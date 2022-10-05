// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_vo.dart';

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
