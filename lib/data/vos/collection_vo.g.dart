// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionVO _$CollectionVOFromJson(Map<String, dynamic> json) => CollectionVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      backDropPath: json['backdrop_path'] as String?,
    )..posterPath = json['poster_path'] as String?;

Map<String, dynamic> _$CollectionVOToJson(CollectionVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backDropPath,
    };
