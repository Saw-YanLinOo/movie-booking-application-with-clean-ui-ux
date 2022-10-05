import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/data/vos/facilities_vo.dart';

import 'time_slot_vo.dart';

part 'cinema_vo.g.dart';

@JsonSerializable()
class CinemaVO {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'promo_vdo_url')
  String? promoVdoUrl;
  @JsonKey(name: 'facilities')
  List<FacilitiesVO>? facilities;
  @JsonKey(name: 'safety')
  List<String>? safety;

  @JsonKey(name: 'timeslots')
  List<TimeSlotVO>? timeSlotList;

  @JsonKey(name: 'timeslot')
  TimeSlotVO? timeSlot;
  CinemaVO({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.promoVdoUrl,
    this.facilities,
    this.safety,
    this.timeSlotList,
    this.timeSlot,
  });

  factory CinemaVO.fromJson(Map<String, dynamic> json) =>
      _$CinemaVOFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaVOToJson(this);
}
