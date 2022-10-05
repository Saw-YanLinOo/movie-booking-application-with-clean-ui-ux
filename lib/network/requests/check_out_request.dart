import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app_view_layer/data/vos/snack_vo.dart';

part 'check_out_request.g.dart';

@JsonSerializable()
class CheckOutRequest {
  @JsonKey(name: 'cinema_day_timeslot_id')
  int? cinemaDayTimeSlotId;
  @JsonKey(name: 'seat_number')
  String? seatNumber;
  @JsonKey(name: 'booking_date')
  String? bookingDate;
  @JsonKey(name: 'movie_id')
  int? movieId;
  @JsonKey(name: 'payment_type_id')
  int? paymentTypeId;
  @JsonKey(name: 'snacks')
  List<SnackVO>? stacks;

  CheckOutRequest({
    this.cinemaDayTimeSlotId,
    this.seatNumber,
    this.bookingDate,
    this.movieId,
    this.paymentTypeId,
    this.stacks,
  });

  factory CheckOutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckOutRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutRequestToJson(this);
}
