import 'package:flutter/material.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/strings.dart';

import '../data/models/movie_model.dart';
import '../data/models/movie_model_impl.dart';
import '../resources/dimens.dart';
import '../viewitems/movie_view.dart';
import '../widgets/search_drop_down_view.dart';
import 'movie_detail_page.dart';

class SearchMoviePage extends StatefulWidget {
  final int index;

  const SearchMoviePage({required this.index, Key? key}) : super(key: key);

  @override
  State<SearchMoviePage> createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  MovieModel mMovieModel = MovieModelImpl();

  List<MovieVO>? mNowShowingMovie;
  List<MovieVO>? mCommingSoonMovie;

  @override
  void initState() {
    super.initState();

    if (widget.index == 0) {
      _getNowShowingMovie();
    } else {
      _getCommingSoonMovie();
    }
  }

  // Now Showing Movie
  _getNowShowingMovie() {
    mMovieModel.getNowPlayingMovieFromDatabase().listen((movieList) {
      mNowShowingMovie = movieList;
      setState(() {});
    });
  }

  // Comming Soon Movie
  _getCommingSoonMovie() {
    mMovieModel.getUpCommingMovieFromDatabase().listen((movieList) {
      mCommingSoonMovie = movieList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: MARGIN_CARD_MEDIUM),
            child: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        title: TextField(
          cursorColor: Colors.grey,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: SEARCH_MOVIE_TEXT,
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            focusedBorder: InputBorder.none,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: SizedBox(
              width: MARGIN_MEDIUM_2,
              height: MARGIN_MEDIUM_2,
              child: Image.asset(
                SEARCH_MOVIE_FAILTER_ICON,
                color: PRIMARY_COLOR,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MARGIN_MEDIUM_3,
              ),
              SearchDropDownView(hint: 'Genres', items: ['Drama', 'Cartoon']),
              SizedBox(
                width: MARGIN_MEDIUM,
              ),
              SearchDropDownView(hint: 'Formats', items: ['Drama', 'Cartoon']),
            ],
          ),
          Expanded(
            child: MovieSectionView(
              widget.index == 0 ? mNowShowingMovie : mCommingSoonMovie,
              selectedIndex: widget.index,
            ),
          ),
        ],
      ),
    );
  }
}

class MovieSectionView extends StatelessWidget {
  const MovieSectionView(
    this.movieList, {
    this.selectedIndex,
    Key? key,
  }) : super(key: key);

  final int? selectedIndex;
  final List<MovieVO>? movieList;
  @override
  Widget build(BuildContext context) {
    return movieList == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: MARGIN_LARGE,
              mainAxisSpacing: MARGIN_LARGE,
              childAspectRatio: 3 / 4,
            ),
            shrinkWrap: true,
            itemCount: movieList?.length ?? 0,
            padding: const EdgeInsets.only(
              left: MARGIN_LARGE,
              right: MARGIN_LARGE,
              top: MARGIN_LARGE,
              bottom: MARGIN_MEDIUM,
            ),
            itemBuilder: (context, index) {
              var movie = movieList?[index] ?? MovieVO();
              return MovieItemView(
                onPressedMovie: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MovieDetailPage(
                        movie: movie,
                        index: selectedIndex,
                      ),
                    ),
                  );
                },
                index: selectedIndex,
                movie: movie,
              );
            },
          );
  }
}
