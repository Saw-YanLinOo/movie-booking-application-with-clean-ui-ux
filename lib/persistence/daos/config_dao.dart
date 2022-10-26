import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class ConfigDao {
  ConfigDao._internal();

  static final ConfigDao _singleton = ConfigDao._internal();

  factory ConfigDao() => _singleton;

  void saveConfig(List<ConfigVO> configList) async {
    Map<int?, ConfigVO> configMap = {
      for (var config in configList) config.id: config
    };

    await getConfigBox().putAll(configMap);
  }

  List<ConfigVO> getConfig() {
    return getConfigBox().values.toList();
  }

  Box<ConfigVO> getConfigBox() {
    return Hive.box<ConfigVO>(BOX_NAME_CONFIG_VO);
  }
}
