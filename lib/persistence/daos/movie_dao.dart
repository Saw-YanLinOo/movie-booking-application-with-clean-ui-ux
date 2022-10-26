import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../data/vos/movie_vo.dart';
import '../hive_constants.dart';

class MovieDao {
  MovieDao._internal();

  static final MovieDao _singleton = MovieDao._internal();

  factory MovieDao() => _singleton;

  void saveMovies(List<MovieVO> movieList) async {
    Map<int?, MovieVO> movieMap = {
      for (var movie in movieList) movie.id: movie
    };
    debugPrint('now playing movie map:::::::: ${movieMap}');
    await getMovieBox().putAll(movieMap);
  }

  void saveSingleMovie(MovieVO movie) async {
    return getMovieBox().put(movie.id, movie);
  }

  List<MovieVO> getAllMovies() {
    return getMovieBox().values.toList();
  }

  MovieVO? getMovieById(int movieId) {
    return getMovieBox().get(movieId);
  }

  List<MovieVO> getNowPlayingMovies() {
    if (getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((movie) => movie.isNowShowing ?? false)
          .toList();
    } else {
      return [];
    }
  }

  List<MovieVO> getCommingSoonMovies() {
    if (getAllMovies().isNotEmpty) {
      return getAllMovies()
          .where((movie) => movie.isCommingSoon ?? false)
          .toList();
    } else {
      return [];
    }
  }

  Stream<void> getMovieEventStream() {
    return getMovieBox().watch();
  }

  Stream<List<MovieVO>> getNowPlayingMoviesStream() {
    return Stream.value(getNowPlayingMovies());
  }

  Stream<List<MovieVO>> getCommingSoonMoviesStream() {
    return Stream.value(getCommingSoonMovies());
  }

  Stream<MovieVO?> getMovieByIdStream(int movieId) {
    return Stream.value(getMovieBox().get(movieId));
  }

  Box<MovieVO> getMovieBox() {
    return Hive.box<MovieVO>(BOX_NAME_MOVIE_VO);
  }
}
