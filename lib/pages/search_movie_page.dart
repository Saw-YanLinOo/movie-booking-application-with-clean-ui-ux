import 'package:flutter/material.dart';
import 'package:movie_app_view_layer/dummey/dummey_data.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/strings.dart';

import '../resources/dimens.dart';
import '../view_items/movie_view.dart';
import '../widgets/search_drop_down_view.dart';
import 'movie_detail_page.dart';

class SearchMoviePage extends StatelessWidget {
  final int index;

  const SearchMoviePage({required this.index, Key? key}) : super(key: key);

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
              index == 0 ? nowShowingMovieList : upCommingMovieList,
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
    Key? key,
  }) : super(key: key);

  final List<Map<String, String>> movieList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: MARGIN_LARGE,
          mainAxisSpacing: MARGIN_LARGE,
          childAspectRatio: 3 / 4,
        ),
        shrinkWrap: true,
        itemCount: movieList.length,
        padding: const EdgeInsets.only(
            left: MARGIN_LARGE,
            right: MARGIN_LARGE,
            top: MARGIN_LARGE,
            bottom: MARGIN_MEDIUM),
        itemBuilder: (context, index) {
          var movie = movieList[index];
          return MovieItemView(
            onPressedMovie: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailPage(
                    movie: movie,
                  ),
                ),
              );
            },
            movie: movie,
          );
        });
  }
}
