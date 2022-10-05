// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:movie_app_view_layer/data/vos/snack_vo.dart';
import 'package:movie_app_view_layer/data/vos/time_slot_vo.dart';

part 'check_out_vo.g.dart';

@JsonSerializable()
class CheckOutVO {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'booking_no')
  String? bookingNo;
  @JsonKey(name: 'booking_date')
  String? bookingDate;
  @JsonKey(name: 'row')
  String? row;
  @JsonKey(name: 'seat')
  String? seat;
  @JsonKey(name: 'total_seat')
  int? totalSeat;
  @JsonKey(name: 'total')
  String? total;
  @JsonKey(name: 'movie_id')
  int? movieId;
  @JsonKey(name: 'cinema_id')
  int? cinemaId;
  @JsonKey(name: 'username')
  String? userName;
  @JsonKey(name: 'timeslot')
  TimeSlotVO? timeSlot;
  @JsonKey(name: 'snacks')
  List<SnackVO>? snackList;
  @JsonKey(name: 'qr_code')
  String? qrCode;

  CheckOutVO({
    this.id,
    this.bookingNo,
    this.bookingDate,
    this.row,
    this.seat,
    this.totalSeat,
    this.total,
    this.movieId,
    this.cinemaId,
    this.userName,
    this.timeSlot,
    this.snackList,
    this.qrCode,
  });

  factory CheckOutVO.fromJson(Map<String, dynamic> json) =>
      _$CheckOutVOFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOutVOToJson(this);
}

// {
//         "id": 354,
//         "booking_no": "Pinoneer-7662-1514",
//         "booking_date": "2022-02-19",
//         "row": "B",
//         "seat": "B-9",
//         "total_seat": 1,
//         "total": "$19",
//         "movie_id": 616037,
//         "cinema_id": 2,
//         "username": null,
//         "timeslot": {
//             "cinema_day_timeslot_id": 25,
//             "start_time": "10:00 AM"
//         },
//         "snacks": [
//             {
//                 "id": 664,
//                 "name": "Popcorn",
//                 "description": "Et dolores eaque officia aut.",
//                 "image": "/img/snack.jpg",
//                 "price": 2,
//                 "unit_price": 2,
//                 "quantity": 2,
//                 "total_price": 4
//             },
//             {
//                 "id": 665,
//                 "name": "Carrots",
//                 "description": "At vero et doloribus sint porro ipsum consequatur.",
//                 "image": "/img/snack.jpg",
//                 "price": 4,
//                 "unit_price": 4,
//                 "quantity": 3,
//                 "total_price": 12
//             }
//         ],
//         "qr_code": "uploads/img/qr-code/img-Pinoneer-7662-1514.png"
//     }