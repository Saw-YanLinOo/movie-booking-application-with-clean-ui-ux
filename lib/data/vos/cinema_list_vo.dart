// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';
part 'cinema_list_vo.g.dart';

@HiveType(
    typeId: HIVE_TYPE_ID_CINEMA_LIST_VO, adapterName: 'CinemaListVOAdapter')
class CinemaListVO {
  @HiveField(0)
  List<CinemaVO>? cinemaList;

  CinemaListVO({
    this.cinemaList,
  });
}
