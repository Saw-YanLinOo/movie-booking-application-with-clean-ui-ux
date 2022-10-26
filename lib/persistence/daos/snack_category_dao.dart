import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/banner_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_category_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class SnackCategoryDao {
  SnackCategoryDao._internal();

  static final SnackCategoryDao _singleton = SnackCategoryDao._internal();

  factory SnackCategoryDao() => _singleton;

  void saveSnackCategory(List<SnackCategoryVO> snackCategoryList) async {
    Map<int?, SnackCategoryVO> snackCatMap = {
      for (var snackCat in snackCategoryList) snackCat.id: snackCat
    };

    await getSnackCategoryBox().putAll(snackCatMap);
  }

  List<SnackCategoryVO> getSnackCategory() {
    return getSnackCategoryBox().values.toList();
  }

  Box<SnackCategoryVO> getSnackCategoryBox() {
    return Hive.box<SnackCategoryVO>(BOX_NAME_SNACK_CATEGORY_VO);
  }
}
