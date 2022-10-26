import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/banner_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_category_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class SnackDao {
  SnackDao._internal();

  static final SnackDao _singleton = SnackDao._internal();

  factory SnackDao() => _singleton;

  void saveSnacks(List<SnackVO> snackList) async {
    Map<int?, SnackVO> snackCatMap = {
      for (var snackCat in snackList) snackCat.id: snackCat
    };

    await getSnackBox().putAll(snackCatMap);
  }

  List<SnackVO> getSnackList(int categoryId) {
    if (categoryId == 0) {
      return getSnackBox().values.toList();
    } else {
      return getSnackBox()
          .values
          .where((snack) => snack.categoryId == categoryId)
          .toList();
    }
  }

  Stream<void> getSnackEventStream() {
    return getSnackBox().watch();
  }

  Stream<List<SnackVO>> getSnackListStream(int categoryId) {
    return Stream.value(getSnackList(categoryId));
  }

  Box<SnackVO> getSnackBox() {
    return Hive.box<SnackVO>(BOX_NAME_SNACK_VO);
  }
}
