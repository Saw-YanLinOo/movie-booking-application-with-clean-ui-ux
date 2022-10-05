// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_operation_vo.dart';

class CheckOutDataVO {
  MovieVO? mMovie;

  CinemaVO? mCinema;

  SnackOperationVO? mSnacks;

  CheckOutDataVO({
    this.mMovie,
    this.mCinema,
    this.mSnacks,
  });
}
