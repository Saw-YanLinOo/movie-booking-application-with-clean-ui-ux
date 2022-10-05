import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/date_vo.dart';
import '../../data/vos/movie_vo.dart';

part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse {
  @JsonKey(name: 'dates')
  DateVO? dates;

  @JsonKey(name: 'page')
  int? page;

  @JsonKey(name: 'results')
  List<MovieVO>? results;

  @JsonKey(name: 'total_pages')
  int? totalPages;

  @JsonKey(name: 'total_results')
  int? totalResults;

  MovieListResponse({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
