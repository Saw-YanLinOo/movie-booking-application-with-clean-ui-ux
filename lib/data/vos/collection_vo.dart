import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';
part 'collection_vo.g.dart';

@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_COLLECTION_VO, adapterName: 'CollectionVOAdapter')
class CollectionVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @JsonKey(name: "poster_path")
  @HiveField(2)
  String? posterPath;

  @JsonKey(name: "backdrop_path")
  @HiveField(3)
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
