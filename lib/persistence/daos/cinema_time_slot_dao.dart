import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/cinema_list_vo.dart';
import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class CinemaTimeSlotDao {
  CinemaTimeSlotDao._internal();

  static final CinemaTimeSlotDao _singleton = CinemaTimeSlotDao._internal();

  factory CinemaTimeSlotDao() => _singleton;

  void saveCinemaAndTimeSlotByDate(String date, CinemaListVO cinemaList) async {
    await getCinemaBox().put(date, cinemaList);
  }

  List<CinemaVO>? getCinemaListByDate(String date) {
    return getCinemaBox().get(date)?.cinemaList;
  }

  Stream<void> getCinemaEventStream() {
    return getCinemaBox().watch();
  }

  Stream<List<CinemaVO>?> getCinamListByDateStream(String date) {
    return Stream.value(getCinemaBox().get(date)?.cinemaList);
  }

  Box<CinemaListVO> getCinemaBox() {
    return Hive.box<CinemaListVO>(BOX_NAME_CINEMA_VO);
  }
}
