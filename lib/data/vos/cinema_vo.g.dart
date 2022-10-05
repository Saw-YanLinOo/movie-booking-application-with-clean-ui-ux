// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_vo.dart';

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
      timeSlotList: (json['timeslots'] as List<dynamic>?)
          ?.map((e) => TimeSlotVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeSlot: json['timeslot'] == null
          ? null
          : TimeSlotVO.fromJson(json['timeslot'] as Map<String, dynamic>),
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
      'timeslots': instance.timeSlotList,
      'timeslot': instance.timeSlot,
    };
