import 'package:dio/dio.dart';
import 'package:movie_app_view_layer/network/api_constants.dart';
import 'package:retrofit/http.dart';

import '../data/vos/movie_vo.dart';
import 'responses/get_credits_by_movie_response.dart';
import 'responses/movie_list_response.dart';
part 'movie_db_api.g.dart';

@RestApi(baseUrl: MOVIE_DB_BASE_URL)
abstract class MovieDbApi {
  factory MovieDbApi(Dio dio) = _MovieDbApi;

  @GET(ENDPOINT_GET_NOW_PLAYING_MOVIE)
  Future<MovieListResponse> getNowPlayingMovie(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET(ENDPOINT_GET_UP_COMMING_MOVIE)
  Future<MovieListResponse> getUpCommingMovie(
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
    @Query(PARAM_PAGE) String page,
  );

  @GET('$ENDPOINT_GET_MOVIE_DETAILS/{movie_id}')
  Future<MovieVO?> getMovieDetail(
    @Path(PARAM_MOVIE_ID) int movieId,
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
  );

  @GET('$ENDPOINT_GET_CREDITS_BY_MOVIE/{movie_id}/credits')
  Future<GetCreditsByMovieResponse> getCreditsByMovieResponse(
    @Path(PARAM_MOVIE_ID) int movieId,
    @Query(PARAM_API_KEY) String apiKey,
    @Query(PARAM_LANGUAGE) String language,
  );
}
