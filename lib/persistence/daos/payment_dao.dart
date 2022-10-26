import 'package:hive/hive.dart';
import 'package:movie_app_view_layer/data/vos/payment_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

class PaymetnDao {
  PaymetnDao._internal();

  static final PaymetnDao _singleton = PaymetnDao._internal();

  factory PaymetnDao() => _singleton;

  void savePayment(List<PaymentVO> paymentList) async {
    Map<int?, PaymentVO> paymentMap = {
      for (var payment in paymentList) payment.id: payment
    };

    await getPaymentBox().putAll(paymentMap);
  }

  List<PaymentVO> getPayment() {
    return getPaymentBox().values.toList();
  }

  Box<PaymentVO> getPaymentBox() {
    return Hive.box<PaymentVO>(BOX_NAME_PAYMENT_VO);
  }
}
