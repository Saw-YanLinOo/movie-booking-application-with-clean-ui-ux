import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/network/api_constants.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/strings.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../resources/dimens.dart';

class MovieItemView extends StatelessWidget {
  final int? index;
  final MovieVO movie;
  final Function() onPressedMovie;
  const MovieItemView({
    Key? key,
    this.index,
    required this.onPressedMovie,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressedMovie();
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        ),
        child: Column(
          children: [
            Expanded(
              child: MovieItemHeaderView(
                index: index,
                image: movie.posterPath ?? '',
                date: movie.releaseDate,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM,
                vertical: MARGIN_MEDIUM,
              ),
              child: MovieItemFooterView(movie: movie),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieItemHeaderView extends StatelessWidget {
  const MovieItemHeaderView({
    this.index,
    required this.image,
    this.date,
    Key? key,
  }) : super(key: key);

  final int? index;
  final String image;
  final DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: Image.network(
          '$IMAGE_BASE_URL$image',
          fit: BoxFit.cover,
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Visibility(
          visible: index == 0 ? false : true,
          child: Container(
            width: MediaQuery.of(context).size.width / 9,
            margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM,
              vertical: MARGIN_MEDIUM,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM,
              vertical: MARGIN_MEDIUM,
            ),
            decoration: BoxDecoration(
              color: PRIMARY_COLOR,
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            ),
            child: Text('${date?.day}'),
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                ]),
          ),
        ),
      ),
    ]);
  }
}

class MovieItemFooterView extends StatelessWidget {
  const MovieItemFooterView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieVO movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: AutoSizeText(
                movie.title ?? '',
                maxLines: 1,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: MARGIN_CARD_MEDIUM_2,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset(
                  MOVIE_VIEW_IMDB_IAMGE,
                ),
                Text(
                  '${movie.voteAverage ?? '0.0'}',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: MARGIN_CARD_MEDIUM_2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Row(
          children: [
            Text(
              movie.originalLanguage ?? '',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: MARGIN_CARD_MEDIUM_2,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: MARGIN_SMALL,
            ),
            Text(
              '.',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: MARGIN_CARD_MEDIUM_2,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              width: MARGIN_SMALL,
            ),
            Text(
              '${movie.popularity ?? ''}',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: MARGIN_CARD_MEDIUM_2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
