import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/data/vos/payment_vo.dart';

part 'get_payment_response.g.dart';

@JsonSerializable()
class GetPaymentResponse {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<PaymentVO>? data;

  GetPaymentResponse({
    this.code,
    this.message,
    this.data,
  });

  factory GetPaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentResponseToJson(this);
}
