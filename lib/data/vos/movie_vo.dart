// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';

import 'collection_vo.dart';
import 'genre_vo.dart';
import 'production_company_vo.dart';
import 'production_country_vo.dart';
import 'spoken_language_vo.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
class MovieVO {
  @JsonKey(name: 'adult')
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  String? backDropPath;

  @JsonKey(name: 'belongs_to_collection')
  CollectionVO? belongsToCollection;

  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;

  @JsonKey(name: 'budget')
  int? budget;

  @JsonKey(name: 'genres')
  List<GenreVO>? genres;

  @JsonKey(name: 'homepage')
  String? homePage;

  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'imdb_id')
  String? imdbid;

  @JsonKey(name: 'original_language')
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'overview')
  String? overview;

  @JsonKey(name: 'popularity')
  double? popularity;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'production_company')
  List<ProductionCompanyVO>? productionCompany;

  @JsonKey(name: 'production_country')
  List<ProductionCountryVO>? productionCountry;

  @JsonKey(name: 'release_date')
  DateTime? releaseDate;

  @JsonKey(name: 'revenue')
  int? revenue;

  @JsonKey(name: 'runtime')
  int? runtime;

  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguageVO>? spokenLanguages;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'tagline')
  String? tagline;

  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'video')
  bool? video;

  @JsonKey(name: 'vote_average')
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  int? voteCount;

  @JsonKey(name: 'casts')
  List<CreditVO>? casts;

  MovieVO({
    this.adult,
    this.backDropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.budget,
    this.voteCount,
    this.belongsToCollection,
    this.genres,
    this.homePage,
    this.imdbid,
    this.productionCompany,
    this.productionCountry,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
  });

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO(adult: $adult, backDropPath: $backDropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }
}
