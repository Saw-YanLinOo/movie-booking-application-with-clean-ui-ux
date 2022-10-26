import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/data/vos/check_out_data_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/network/api_constants.dart';
import 'package:movie_app_view_layer/pages/choose_cinema_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/widgets/movie_title.dart';

import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../viewitems/actor_view.dart';
import '../widgets/booking_button_view.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage({
    Key? key,
    this.index,
    required this.movie,
  }) : super(key: key);

  final int? index;
  final MovieVO movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  MovieModel mMovieModel = MovieModelImpl();

  MovieVO? mMovie;
  List<CreditVO>? mMovieCredit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Movie Detail
    mMovieModel.getMovieDetail('${widget.movie.id}').then((movie) {
      mMovie = movie;
      setState(() {});
    });
    mMovieModel.getMovieDetailFromDatabase(widget.movie.id ?? 0).then((movie) {
      mMovie = movie;
      setState(() {});
    });

    // Credit
    mMovieModel.getCreditsByMovie('${widget.movie.id}').then((creditList) {
      mMovieCredit = creditList;
      setState(() {});
    });
    mMovieModel
        .getCreditsByMovieIdFromDatabase(widget.movie.id ?? 0)
        .then((creditList) {
      mMovieCredit = creditList;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: mMovie == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  ListView(
                    children: [
                      MovieDetailAppBarView(
                          backDropImage: mMovie?.backDropPath),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_2,
                        ),
                        child: MovieDetailSection(mMovie: mMovie),
                      ),
                      const SizedBox(
                        height: MARGIN_MEDIUM,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(MARGIN_MEDIUM_3),
                        child: MovieCRDView(mMovie: mMovie),
                      ),
                      const SizedBox(
                        height: MARGIN_MEDIUM,
                      ),
                      Visibility(
                        visible: widget.index == 0 ? false : true,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: MARGIN_MEDIUM_2,
                          ),
                          child: NotiReleaseSection(
                            releaseDate: mMovie?.releaseDate,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: MARGIN_MEDIUM_2,
                      ),
                      StoryView(
                        stroyLine: mMovie?.overview,
                      ),
                      const SizedBox(
                        height: MARGIN_XL_LARGE,
                      ),
                      CastView(
                        mMovieCredit: mMovieCredit,
                      ),
                      const SizedBox(
                        height: MARGIN_XXXXL_LARGE,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: MARGIN_XXL_LARGE,
                        vertical: MARGIN_LARGE,
                      ),
                      child: BookingButtonView(
                        title: 'Booking',
                        onTapBooking: () {
                          final mCheckOutData = CheckOutDataVO(mMovie: mMovie);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChooseCinema(checkOutData: mCheckOutData),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: MARGIN_XL_LARGE,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class NotiReleaseSection extends StatelessWidget {
  const NotiReleaseSection({
    Key? key,
    this.releaseDate,
  }) : super(key: key);

  final DateTime? releaseDate;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          MARGIN_MEDIUM,
        ),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Colors.grey.shade900,
            Colors.grey.shade700,
          ],
        ),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Releasing in ${releaseDate?.day} days',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: MARGIN_CARD_MEDIUM,
                ),
                Text(
                  MOVIE_DETAIL_BOOKING_DESCRIPTION_TEXT,
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_3,
                ),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    padding: const EdgeInsets.all(MARGIN_MEDIUM),
                  ),
                  icon: const Icon(
                    Icons.notifications_active,
                    color: Colors.black,
                  ),
                  label: const Text(
                    MOVIE_DETAIL_BOOKING_TEXT,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              MOVIE_DETAIL_RELEASE_IMAGE,
            ),
          ),
        ],
      ),
    );
  }
}

class CastView extends StatelessWidget {
  const CastView({
    Key? key,
    this.mMovieCredit,
  }) : super(key: key);

  final List<CreditVO>? mMovieCredit;

  @override
  Widget build(BuildContext context) {
    return mMovieCredit == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                child: MovieTitle(
                  title: MOVIE_DETAIL_CAST_TEXT,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              SizedBox(
                height: MOVIE_DETAIL_ACTOR_LISTVIEW_HEIGHT,
                child: ListView.builder(
                  itemCount: mMovieCredit?.length ?? 0,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: MARGIN_MEDIUM_3),
                  itemBuilder: (context, index) {
                    return Container(
                      width: MOVIE_DETAIL_ACTOR_VIEW_WIDTH,
                      margin: const EdgeInsets.only(right: MARGIN_MEDIUM_3),
                      child: ActorView(creditVO: mMovieCredit?[index]),
                    );
                  },
                ),
              ),
            ],
          );
  }
}

class StoryView extends StatelessWidget {
  const StoryView({
    Key? key,
    this.stroyLine,
  }) : super(key: key);

  final String? stroyLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          child: MovieTitle(
            title: MOVIE_DETAIL_STORY_TEXT,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: MovieTitle(
            title: '$stroyLine',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class MovieCRDView extends StatelessWidget {
  const MovieCRDView({
    Key? key,
    this.mMovie,
  }) : super(key: key);

  final MovieVO? mMovie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const MovieCRDItem(
          title: 'Censor Rating',
          description: 'U/A',
        ),
        MovieCRDItem(
          title: 'Release Date',
          description:
              '${mMovie?.releaseDate?.month} - ${mMovie?.releaseDate?.day} - ${mMovie?.releaseDate?.year}',
        ),
        MovieCRDItem(
          title: 'Duration',
          description: '${mMovie?.runtime} mins',
        ),
      ],
    );
  }
}

class MovieCRDItem extends StatelessWidget {
  const MovieCRDItem({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
          gradient: const LinearGradient(
            colors: [
              MOVIE_DETAIL_RADIUS_COLOR_ONE,
              MOVIE_DETAIL_RADIUS_COLOR_TWO,
            ],
          ),
          boxShadow: [
            const BoxShadow(
              color: MOVIE_DETAIL_BOX_SHADOW_COLOR,
              spreadRadius: BOX_SHADOW_SPEAD_RADIUS,
              blurRadius: BOX_SHADOW_BLUR_RADIUS,
              offset: Offset(2, 2),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_MEDIUM),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: TEXT_SMALL,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: MARGIN_CARD_MEDIUM_2,
            ),
            Text(
              description,
              style: GoogleFonts.inter(
                fontSize: TEXT_SMALL,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieDetailSection extends StatelessWidget {
  const MovieDetailSection({
    Key? key,
    required this.mMovie,
  }) : super(key: key);

  final MovieVO? mMovie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MOVIE_DETAIL_SCREEN_IMAGE_WIDTH,
          height: MOVIE_DETAIL_SCREEN_IMAGE_HEIGHT,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                top: -MARGIN_LARGE,
                child: Image.network(
                  '$IMAGE_BASE_URL${mMovie?.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(
              MARGIN_MEDIUM_2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MovieTitleView(
                  mMovie: mMovie,
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM_2,
                ),
                MovieTitle(
                  title: '2D, 3D, 3D IMAX',
                  fontWeight: FontWeight.w600,
                ),
                Wrap(
                  spacing: MARGIN_MEDIUM,
                  children: mMovie?.genres
                          ?.map((genre) => GenreChipView(genre.name ?? ''))
                          .toList() ??
                      [],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GenreChipView extends StatelessWidget {
  final String genreText;

  const GenreChipView(
    this.genreText, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        genreText,
        style: GoogleFonts.inter(
          color: Colors.black,
          fontSize: MARGIN_CARD_MEDIUM_2,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: PRIMARY_COLOR,
    );
  }
}

class GeneralChipView extends StatelessWidget {
  final String generalText;

  const GeneralChipView(
    this.generalText, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
          backgroundColor: PRIMARY_COLOR,
          label: Text(
            generalText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          width: MARGIN_SMALL,
        ),
      ],
    );
  }
}

class MovieTitleView extends StatelessWidget {
  const MovieTitleView({
    Key? key,
    this.mMovie,
  }) : super(key: key);

  final MovieVO? mMovie;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: MovieTitle(
            title: mMovie?.title ?? '',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Image.asset(
          'assets/images/imdb.png',
        ),
        Text(
          '${mMovie?.voteAverage ?? 0.0}',
          style: GoogleFonts.inter(
            fontSize: TEXT_REGULAR,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class MovieDetailAppBarView extends StatelessWidget {
  const MovieDetailAppBarView({Key? key, this.backDropImage}) : super(key: key);

  final String? backDropImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MOVIE_DETAILS_SCREEN_APP_BAR_HEIGHT,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              '$IMAGE_BASE_URL$backDropImage',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                top: MARGIN_MEDIUM,
                left: MARGIN_MEDIUM_2,
              ),
              child: BackIconView(
                onTapBack: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.only(
                top: MARGIN_MEDIUM,
                right: MARGIN_MEDIUM_2,
              ),
              child: Icon(
                Icons.share,
                size: MARGIN_XL_LARGE,
                color: Colors.white,
              ),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: PlayButtonView(),
          ),
        ],
      ),
    );
  }
}

class PlayButtonView extends StatelessWidget {
  const PlayButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.5),
      ),
      child: const Icon(
        Icons.play_arrow,
        color: Colors.white,
        size: PLAY_BUTTON_SIZE,
      ),
    );
  }
}

class BackIconView extends StatelessWidget {
  const BackIconView({
    Key? key,
    required this.onTapBack,
  }) : super(key: key);

  final Function onTapBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapBack();
      },
      child: const Icon(
        Icons.arrow_back_ios,
        size: MARGIN_XL_LARGE,
        color: Colors.white,
      ),
    );
  }
}
