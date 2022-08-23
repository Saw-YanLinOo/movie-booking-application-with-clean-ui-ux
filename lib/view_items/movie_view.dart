import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/strings.dart';

import '../resources/dimens.dart';

class MovieItemView extends StatelessWidget {
  final Map<String, String> movie;
  final Function() onPressedMovie;
  const MovieItemView({
    Key? key,
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
                image: movie['image'] ?? '',
                date: movie['showingDate'],
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
    required this.image,
    this.date,
    Key? key,
  }) : super(key: key);

  final String image;
  final String? date;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned.fill(
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Visibility(
          visible: date == null ? false : true,
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
            child: Text(date ?? ''),
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

  final Map<String, String> movie;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              movie['title'] ?? '',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: MARGIN_CARD_MEDIUM_2,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Image.asset(
                  MOVIE_VIEW_IMDB_IAMGE,
                ),
                Text(
                  movie['rating'] ?? "",
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
              movie['countryType'] ?? '',
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
              movie['movieType'] ?? '',
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
