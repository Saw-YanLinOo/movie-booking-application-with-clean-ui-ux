import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_list_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class CreditDao {
  CreditDao._internal();

  static final CreditDao _singleton = CreditDao._internal();

  factory CreditDao() => _singleton;

  void saveCredit(int movieId, CreditListVO creditList) async {
    await getCreditBox().put(movieId, creditList);
  }

  List<CreditListVO> getCredit() {
    return getCreditBox().values.toList();
  }

  CreditListVO? getCreditByMovieId(int movieId) {
    return getCreditBox().get(movieId);
  }

  Box<CreditListVO> getCreditBox() {
    return Hive.box<CreditListVO>(BOX_NAME_CREDIT_VO);
  }
}
