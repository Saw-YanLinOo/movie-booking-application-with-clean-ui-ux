import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/cinema_list_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class CinemaTimeSlotDao {
  CinemaTimeSlotDao._internal();

  static final CinemaTimeSlotDao _singleton = CinemaTimeSlotDao._internal();

  factory CinemaTimeSlotDao() => _singleton;

  void saveCinemaTimeSlot(String date, CinemaListVO cinemaList) async {
    await getCinemaBox().put(date, cinemaList);
  }

  List<CinemaListVO> getCinema() {
    return getCinemaBox().values.toList();
  }

  CinemaListVO? getCinemaListByDate(String date) {
    return getCinemaBox().get(date);
  }

  Box<CinemaListVO> getCinemaBox() {
    return Hive.box<CinemaListVO>(BOX_NAME_CINEMA_VO);
  }
}
