// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentResponse _$GetPaymentResponseFromJson(Map<String, dynamic> json) =>
    GetPaymentResponse(
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPaymentResponseToJson(GetPaymentResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
