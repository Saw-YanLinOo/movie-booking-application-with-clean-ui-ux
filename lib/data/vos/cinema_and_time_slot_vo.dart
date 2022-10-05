import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/data/vos/time_slot_vo.dart';

part 'cinema_and_time_slot_vo.g.dart';

@JsonSerializable()
class CinemaAndTimeSlotVO {
  @JsonKey(name: 'cinema_id')
  int? id;

  @JsonKey(name: 'cinema')
  String? cinema;

  @JsonKey(name: 'timeslots')
  List<TimeSlotVO>? timeSlots;

  CinemaAndTimeSlotVO({
    this.id,
    this.cinema,
    this.timeSlots,
  });

  factory CinemaAndTimeSlotVO.fromJson(Map<String, dynamic> json) =>
      _$CinemaAndTimeSlotVOFromJson(json);

  Map<String, dynamic> toJson() => _$CinemaAndTimeSlotVOToJson(this);
}
