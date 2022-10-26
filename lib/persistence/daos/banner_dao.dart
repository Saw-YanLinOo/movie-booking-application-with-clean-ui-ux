import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/banner_vo.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class BannerDao {
  BannerDao._internal();

  static final BannerDao _singleton = BannerDao._internal();

  factory BannerDao() => _singleton;

  void saveBannerList(List<BannerVO> bannerList) async {
    Map<int?, BannerVO> bannerMap = {
      for (var banner in bannerList) banner.id: banner
    };

    await getBannerBox().putAll(bannerMap);
  }

  List<BannerVO> getBannerList() {
    return getBannerBox().values.toList();
  }

  Stream<void> getBannerEventStream() {
    return getBannerBox().watch();
  }

  Stream<List<BannerVO>> getBannerListStream() {
    return Stream.value(getBannerBox().values.toList());
  }

  Box<BannerVO> getBannerBox() {
    return Hive.box<BannerVO>(BOX_NAME_BANNER_VO);
  }
}
