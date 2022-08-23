import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/choose_cinema_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/widgets/movie_title.dart';

import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../view_items/actor_view.dart';
import '../widgets/booking_button_view.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  final Map<String, dynamic> movie;

  @override
  Widget build(BuildContext context) {
    const movieTypeList = [
      'Action',
      'New',
      'Drama',
      'Adventure',
      'Animation',
    ];

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                MovieDetailAppBarView(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM_2,
                  ),
                  child: MovieDetailView(movieTypeList: movieTypeList),
                ),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Padding(
                  padding: EdgeInsets.all(MARGIN_MEDIUM_3),
                  child: MovieCRDView(),
                ),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Visibility(
                  visible: movie['showingDate'] == null ? false : true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM_2,
                    ),
                    child: NotiReleaseSection(),
                  ),
                ),
                SizedBox(
                  height: MARGIN_MEDIUM_2,
                ),
                StoryView(),
                SizedBox(
                  height: MARGIN_XL_LARGE,
                ),
                CastView(),
                SizedBox(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseCinema(),
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
                      ]),
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
  }) : super(key: key);

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
                  'Releasing in 5 day',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
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
                SizedBox(
                  height: MARGIN_MEDIUM_3,
                ),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                    padding: const EdgeInsets.all(MARGIN_MEDIUM),
                  ),
                  icon: Icon(
                    Icons.notifications_active,
                    color: Colors.black,
                  ),
                  label: Text(
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            itemCount: 10,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_3),
            itemBuilder: ((context, index) {
              return Container(
                width: MOVIE_DETAIL_ACTOR_VIEW_WIDTH,
                margin: const EdgeInsets.only(right: MARGIN_MEDIUM_3),
                child: const ActorView(),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class StoryView extends StatelessWidget {
  const StoryView({
    Key? key,
  }) : super(key: key);

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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: MovieTitle(
            title:
                'In the 1970s, young Gru tries to join a group of supervillains called the Vicious 6 after they oust their leader -- the legendary fighter Wild Knuckles. When the interview turns disastrous, Gru and his Minions go on the run with the Vicious 6 hot on their tails. Luckily, he finds an unlikely source for guidance -- Wild Knuckles himself -- and soon discovers that even bad guys need a little help from their friends.',
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const MovieCRDItem(
          title: 'Censor Rating',
          description: 'U/A',
        ),
        const MovieCRDItem(
          title: 'Release Date',
          description: 'May 8th, 2022',
        ),
        const MovieCRDItem(
          title: 'Duration',
          description: '2h 15min',
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

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({
    Key? key,
    required this.movieTypeList,
  }) : super(key: key);

  final List<String> movieTypeList;

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
                child: Image.asset(
                  'assets/images/movie_item.png',
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
                const MovieTitleView(),
                const SizedBox(
                  height: MARGIN_MEDIUM_2,
                ),
                const MovieTitle(
                  title: '2D, 3D, 3D IMAX, 3D DBOX 2D, 3D',
                  fontWeight: FontWeight.w600,
                ),
                Wrap(
                  spacing: MARGIN_MEDIUM,
                  children: movieTypeList
                      .map(
                        (e) => GenreChipView(e),
                      )
                      .toList(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MovieTitle(
          title: 'Venom',
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(
          width: MARGIN_MEDIUM,
        ),
        Image.asset(
          'assets/images/imdb.png',
        ),
        Text(
          '7.1',
          style: GoogleFonts.inter(
            fontSize: MARGIN_MEDIUM_2,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}

class MovieDetailAppBarView extends StatelessWidget {
  const MovieDetailAppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MOVIE_DETAILS_SCREEN_APP_BAR_HEIGHT,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/movie_item.png',
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
