import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/user_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class UserDao {
  UserDao._internal();

  static final UserDao _singleton = UserDao._internal();

  factory UserDao() => _singleton;

  void saveUser(UserVo user) async {
    return getUserBox().put(user.id, user);
  }

  UserVo? getUser() {
    return getUserBox().values.isNotEmpty ? getUserBox().values.first : null;
  }

  String getUserToken() {
    return getUserBox().values.isNotEmpty
        ? getUserBox().values.first.token ?? ''
        : '';
  }

  Stream<void> getUserEventStream() {
    return getUserBox().watch();
  }

  Stream<UserVo?> getUserStream() {
    return Stream.value(getUser());
  }

  Box<UserVo> getUserBox() {
    return Hive.box<UserVo>(BOX_NAME_USER_VO);
  }
}
