import 'package:json_annotation/json_annotation.dart';

part 'time_slot_vo.g.dart';

@JsonSerializable()
class TimeSlotVO {
  @JsonKey(name: 'cinema_day_timeslot_id')
  int? id;

  @JsonKey(name: 'start_time')
  String? startTime;

  @JsonKey(name: 'status')
  int? status;

  TimeSlotVO({
    this.id,
    this.startTime,
    this.status,
  });

  factory TimeSlotVO.fromJson(Map<String, dynamic> json) =>
      _$TimeSlotVOFromJson(json);

  Map<String, dynamic> toJson() => _$TimeSlotVOToJson(this);
}

// {
//                     "cinema_day_timeslot_id": 7,
//                     "start_time": "9:30 AM",
//                     "status": 1
//                 }