// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

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
    )..casts = (json['casts'] as List<dynamic>?)
        ?.map((e) => CreditVO.fromJson(e as Map<String, dynamic>))
        .toList();

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
    };
