// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'get_otp_response.g.dart';

@JsonSerializable()
class GetOtpResponse {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'message')
  String? message;

  GetOtpResponse({
    this.code,
    this.message,
  });

  factory GetOtpResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOtpResponseToJson(this);
}
