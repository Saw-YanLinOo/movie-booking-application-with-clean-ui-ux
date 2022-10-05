import 'package:json_annotation/json_annotation.dart';
part 'collection_vo.g.dart';

@JsonSerializable()
class CollectionVO {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "poster_path")
  String? posterPath;

  @JsonKey(name: "backdrop_path")
  String? backDropPath;

  CollectionVO({
    this.id,
    this.name,
    this.backDropPath,
  });

  factory CollectionVO.fromJson(Map<String, dynamic> json) =>
      _$CollectionVOFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionVOToJson(this);
}
