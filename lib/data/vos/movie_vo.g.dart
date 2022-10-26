// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieVOAdapter extends TypeAdapter<MovieVO> {
  @override
  final int typeId = 12;

  @override
  MovieVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVO(
      adult: fields[0] as bool?,
      backDropPath: fields[1] as String?,
      genreIds: (fields[3] as List?)?.cast<int>(),
      id: fields[7] as int?,
      originalLanguage: fields[9] as String?,
      originalTitle: fields[10] as String?,
      overview: fields[11] as String?,
      popularity: fields[12] as double?,
      posterPath: fields[13] as String?,
      releaseDate: fields[16] as DateTime?,
      title: fields[22] as String?,
      video: fields[23] as bool?,
      voteAverage: fields[24] as double?,
      budget: fields[4] as int?,
      voteCount: fields[25] as int?,
      belongsToCollection: fields[2] as CollectionVO?,
      genres: (fields[5] as List?)?.cast<GenreVO>(),
      homePage: fields[6] as String?,
      imdbid: fields[8] as String?,
      productionCompany: (fields[14] as List?)?.cast<ProductionCompanyVO>(),
      productionCountry: (fields[15] as List?)?.cast<ProductionCountryVO>(),
      revenue: fields[17] as int?,
      runtime: fields[18] as int?,
      spokenLanguages: (fields[19] as List?)?.cast<SpokenLanguageVO>(),
      status: fields[20] as String?,
      tagline: fields[21] as String?,
      isCommingSoon: fields[28] as bool?,
      isNowShowing: fields[27] as bool?,
      casts: (fields[26] as List?)?.cast<CreditVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, MovieVO obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backDropPath)
      ..writeByte(2)
      ..write(obj.belongsToCollection)
      ..writeByte(3)
      ..write(obj.genreIds)
      ..writeByte(4)
      ..write(obj.budget)
      ..writeByte(5)
      ..write(obj.genres)
      ..writeByte(6)
      ..write(obj.homePage)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.imdbid)
      ..writeByte(9)
      ..write(obj.originalLanguage)
      ..writeByte(10)
      ..write(obj.originalTitle)
      ..writeByte(11)
      ..write(obj.overview)
      ..writeByte(12)
      ..write(obj.popularity)
      ..writeByte(13)
      ..write(obj.posterPath)
      ..writeByte(14)
      ..write(obj.productionCompany)
      ..writeByte(15)
      ..write(obj.productionCountry)
      ..writeByte(16)
      ..write(obj.releaseDate)
      ..writeByte(17)
      ..write(obj.revenue)
      ..writeByte(18)
      ..write(obj.runtime)
      ..writeByte(19)
      ..write(obj.spokenLanguages)
      ..writeByte(20)
      ..write(obj.status)
      ..writeByte(21)
      ..write(obj.tagline)
      ..writeByte(22)
      ..write(obj.title)
      ..writeByte(23)
      ..write(obj.video)
      ..writeByte(24)
      ..write(obj.voteAverage)
      ..writeByte(25)
      ..write(obj.voteCount)
      ..writeByte(26)
      ..write(obj.casts)
      ..writeByte(27)
      ..write(obj.isNowShowing)
      ..writeByte(28)
      ..write(obj.isCommingSoon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVO _$MovieVOFromJson(Map<String, dynamic> json) => MovieVO(
      adult: json['adult'] as bool?,
      backDropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      id: json['id'] as int?,
      originalLanguage: json['original_language'] as String?,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      posterPath: json['poster_path'] as String?,
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      title: json['title'] as String?,
      video: json['video'] as bool?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
      budget: json['budget'] as int?,
      voteCount: json['vote_count'] as int?,
      belongsToCollection: json['belongs_to_collection'] == null
          ? null
          : CollectionVO.fromJson(
              json['belongs_to_collection'] as Map<String, dynamic>),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => GenreVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      homePage: json['homepage'] as String?,
      imdbid: json['imdb_id'] as String?,
      productionCompany: (json['production_company'] as List<dynamic>?)
          ?.map((e) => ProductionCompanyVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountry: (json['production_country'] as List<dynamic>?)
          ?.map((e) => ProductionCountryVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      revenue: json['revenue'] as int?,
      runtime: json['runtime'] as int?,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
          ?.map((e) => SpokenLanguageVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      tagline: json['tagline'] as String?,
      isCommingSoon: json['isCommingSoon'] as bool?,
      isNowShowing: json['isNowShowing'] as bool?,
      casts: (json['casts'] as List<dynamic>?)
          ?.map((e) => CreditVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieVOToJson(MovieVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backDropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'genre_ids': instance.genreIds,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homePage,
      'id': instance.id,
      'imdb_id': instance.imdbid,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_company': instance.productionCompany,
      'production_country': instance.productionCountry,
      'release_date': instance.releaseDate?.toIso8601String(),
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'casts': instance.casts,
      'isNowShowing': instance.isNowShowing,
      'isCommingSoon': instance.isCommingSoon,
    };
