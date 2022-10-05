
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MovieDetailResponse {
  
  @JsonKey(name:'code')
  int? code;

  @JsonKey(name:'message')
  String? message;
  
}