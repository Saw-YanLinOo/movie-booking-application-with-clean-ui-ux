import 'package:movie_app_view_layer/data/vos/snack_vo.dart';

class SnackOperationVO {
  List<SnackVO> snackList = [];
  int totalPrice = 0;

  addSnack(SnackVO snack) {
    var snackIdList = snackList.map((e) => e.id);

    if (!snackIdList.contains(snack.id)) {
      snack.quantity = 1;
      snackList.add(snack);
      totalPrice = totalPrice + (snack.price ?? 0);
    } else {
      for (int i = 0; i < snackList.length; i++) {
        if (snack.id == snackList[i].id) {
          var temp = snackList[i].quantity ?? 0;
          snackList[i].quantity = temp + 1;
          totalPrice = totalPrice + (snack.price ?? 0);
        }
      }
    }
  }

  reduceSnack(SnackVO snack) {
    for (int i = 0; i < snackList.length; i++) {
      if (snack.id == snackList[i].id) {
        if ((snack.quantity ?? 0) > 0) {
          var temp = snackList[i].quantity ?? 0;
          snackList[i].quantity = temp - 1;
          totalPrice = totalPrice - (snack.price ?? 0);
        } else {
          snackList.remove(snack);
        }
      }
    }
  }
}
