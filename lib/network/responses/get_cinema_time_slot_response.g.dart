// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cinema_time_slot_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCinemaTimeSlotResponse _$GetCinemaTimeSlotResponseFromJson(
        Map<String, dynamic> json) =>
    GetCinemaTimeSlotResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CinemaAndTimeSlotVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCinemaTimeSlotResponseToJson(
        GetCinemaTimeSlotResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
