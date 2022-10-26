// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';

import 'collection_vo.dart';
import 'genre_vo.dart';
import 'production_company_vo.dart';
import 'production_country_vo.dart';
import 'spoken_language_vo.dart';

part 'movie_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_MOVIE_VO, adapterName: 'MovieVOAdapter')
class MovieVO {
  @JsonKey(name: 'adult')
  @HiveField(0)
  bool? adult;

  @JsonKey(name: 'backdrop_path')
  @HiveField(1)
  String? backDropPath;

  @JsonKey(name: 'belongs_to_collection')
  @HiveField(2)
  CollectionVO? belongsToCollection;

  @JsonKey(name: 'genre_ids')
  @HiveField(3)
  List<int>? genreIds;

  @JsonKey(name: 'budget')
  @HiveField(4)
  int? budget;

  @JsonKey(name: 'genres')
  @HiveField(5)
  List<GenreVO>? genres;

  @JsonKey(name: 'homepage')
  @HiveField(6)
  String? homePage;

  @JsonKey(name: 'id')
  @HiveField(7)
  int? id;

  @JsonKey(name: 'imdb_id')
  @HiveField(8)
  String? imdbid;

  @JsonKey(name: 'original_language')
  @HiveField(9)
  String? originalLanguage;

  @JsonKey(name: 'original_title')
  @HiveField(10)
  String? originalTitle;

  @JsonKey(name: 'overview')
  @HiveField(11)
  String? overview;

  @JsonKey(name: 'popularity')
  @HiveField(12)
  double? popularity;

  @JsonKey(name: 'poster_path')
  @HiveField(13)
  String? posterPath;

  @JsonKey(name: 'production_company')
  @HiveField(14)
  List<ProductionCompanyVO>? productionCompany;

  @JsonKey(name: 'production_country')
  @HiveField(15)
  List<ProductionCountryVO>? productionCountry;

  @JsonKey(name: 'release_date')
  @HiveField(16)
  DateTime? releaseDate;

  @JsonKey(name: 'revenue')
  @HiveField(17)
  int? revenue;

  @JsonKey(name: 'runtime')
  @HiveField(18)
  int? runtime;

  @JsonKey(name: 'spoken_languages')
  @HiveField(19)
  List<SpokenLanguageVO>? spokenLanguages;

  @JsonKey(name: 'status')
  @HiveField(20)
  String? status;

  @JsonKey(name: 'tagline')
  @HiveField(21)
  String? tagline;

  @JsonKey(name: 'title')
  @HiveField(22)
  String? title;

  @JsonKey(name: 'video')
  @HiveField(23)
  bool? video;

  @JsonKey(name: 'vote_average')
  @HiveField(24)
  double? voteAverage;

  @JsonKey(name: 'vote_count')
  @HiveField(25)
  int? voteCount;

  @JsonKey(name: 'casts')
  @HiveField(26)
  List<CreditVO>? casts;

  @HiveField(27)
  bool? isNowShowing;

  @HiveField(28)
  bool? isCommingSoon;

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
    this.isCommingSoon,
    this.isNowShowing,
    this.casts,
  });

  factory MovieVO.fromJson(Map<String, dynamic> json) =>
      _$MovieVOFromJson(json);

  Map<String, dynamic> toJson() => _$MovieVOToJson(this);

  @override
  String toString() {
    return 'MovieVO(adult: $adult, backDropPath: $backDropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount)';
  }
}
