import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/cinema_vo.dart';

part 'get_cinema_time_slot_response.g.dart';

@JsonSerializable()
class GetCinemaTimeSlotResponse {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<CinemaVO>? data;

  GetCinemaTimeSlotResponse({
    this.code,
    this.message,
    this.data,
  });

  factory GetCinemaTimeSlotResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCinemaTimeSlotResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetCinemaTimeSlotResponseToJson(this);
}
