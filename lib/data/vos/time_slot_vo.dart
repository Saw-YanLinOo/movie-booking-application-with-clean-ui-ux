import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

part 'time_slot_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_TIME_SLOT_VO, adapterName: 'TimeSlotVOAdapter')
class TimeSlotVO {
  @JsonKey(name: 'cinema_day_timeslot_id')
  @HiveField(0)
  int? id;

  @JsonKey(name: 'start_time')
  @HiveField(1)
  String? startTime;

  @JsonKey(name: 'status')
  @HiveField(2)
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