import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_list_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class CreditDao {
  CreditDao._internal();

  static final CreditDao _singleton = CreditDao._internal();

  factory CreditDao() => _singleton;

  void saveCreditByMovieId(int movieId, CreditListVO creditList) async {
    await getCreditBox().put(movieId, creditList);
  }

  List<CreditVO>? getCreditListByMovieId(int movieId) {
    return getCreditBox().get(movieId)?.creditList;
  }

  Stream<void> getCreditEventStream() {
    return getCreditBox().watch();
  }

  Stream<List<CreditListVO>> getCreditListStream() {
    return Stream.value(getCreditBox().values.toList());
  }

  Stream<List<CreditVO>?> getCreditListByMovieIdStream(int movieId) {
    return Stream.value(getCreditBox().get(movieId)?.creditList);
  }

  Box<CreditListVO> getCreditBox() {
    return Hive.box<CreditListVO>(BOX_NAME_CREDIT_VO);
  }
}
