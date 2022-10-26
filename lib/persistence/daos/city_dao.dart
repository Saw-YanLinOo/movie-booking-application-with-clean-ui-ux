import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class CityDao {
  CityDao._internal();

  static final CityDao _singleton = CityDao._internal();

  factory CityDao() => _singleton;

  void saveCities(List<CityVO> cityList) async {
    Map<int?, CityVO> cityMap = {for (var city in cityList) city.id: city};

    await getCityBox().putAll(cityMap);
  }

  List<CityVO> getCityList() {
    return getCityBox().values.toList();
  }

  Stream<void> getCityEventStream() {
    return getCityBox().watch();
  }

  Stream<List<CityVO>> getCityListStream() {
    return Stream.value(getCityBox().values.toList());
  }

  Box<CityVO> getCityBox() {
    return Hive.box<CityVO>(BOX_NAME_CITY_VO);
  }
}
