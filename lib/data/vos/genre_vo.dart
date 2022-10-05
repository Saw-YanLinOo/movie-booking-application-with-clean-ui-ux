// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'genre_vo.g.dart';

@JsonSerializable()
class GenreVO {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  GenreVO({
    this.id,
    this.name,
  });

  factory GenreVO.fromJson(Map<String, dynamic> json) =>
      _$GenreVOFromJson(json);

  Map<String, dynamic> toJson() => _$GenreVOToJson(this);
}
