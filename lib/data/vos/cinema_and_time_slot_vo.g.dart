// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_and_time_slot_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaAndTimeSlotVO _$CinemaAndTimeSlotVOFromJson(Map<String, dynamic> json) =>
    CinemaAndTimeSlotVO(
      id: json['cinema_id'] as int?,
      cinema: json['cinema'] as String?,
      timeSlots: (json['timeslots'] as List<dynamic>?)
          ?.map((e) => TimeSlotVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CinemaAndTimeSlotVOToJson(
        CinemaAndTimeSlotVO instance) =>
    <String, dynamic>{
      'cinema_id': instance.id,
      'cinema': instance.cinema,
      'timeslots': instance.timeSlots,
    };
