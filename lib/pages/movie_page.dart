import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:movie_app_view_layer/pages/movie_detail_page.dart';
import 'package:movie_app_view_layer/pages/search_movie_page.dart';
import 'package:movie_app_view_layer/resources/strings.dart';
import 'package:movie_app_view_layer/widgets/icon.dart';
import 'package:movie_app_view_layer/widgets/location_text.dart';

import '../dummey/dummey_data.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../view_items/movie_view.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        elevation: 0,
        leadingWidth: 120,
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          child: const LocationText(title: 'Yangon'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: AppBarIconItemView(
              icon: Icons.search,
              onTapIcon: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchMoviePage(
                      index: index,
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            child: AppBarIconItemView(icon: Icons.notifications),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: MARGIN_MEDIUM_2,
              right: MARGIN_MEDIUM_2,
            ),
            child: CustomIcon(image: QR_CODE_IMAGE),
          ),
        ],
      ),
      body: ListView(
        children: [
          const BannerSectionView(),
          const SizedBox(
            height: MARGIN_SMALL,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
            ),
            child: SelectMovieSection(
              onTapMovie: (value) {
                index = value;
                print('index == $index');
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: MARGIN_LARGE,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_LARGE,
            ),
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
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var movie = movieList[index];
          return MovieItemView(
            movie: movie,
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
          );
        });
  }
}

class SelectMovieSection extends StatelessWidget {
  const SelectMovieSection({
    required this.onTapMovie,
    Key? key,
  }) : super(key: key);

  final Function(int) onTapMovie;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_PAGE_BUTTON_HEIGHT,
      padding: const EdgeInsets.all(MARGIN_MEDIUM),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_SMALL),
        color: MOVIE_PAGE_TEXT_BUTTON_BACKGROUND_COLOR,
      ),
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          onTap: onTapMovie,
          indicator: BoxDecoration(
            color: PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(MARGIN_SMALL),
          ),
          labelColor: MOVIE_PAGE_TEXT_BUTTON_COLOR,
          tabs: const [
            Tab(
              text: MOVIE_PAGE_NOW_SHOWING,
            ),
            Tab(
              text: MOVIE_PAGE_COMMING_SOON,
            ),
          ],
        ),
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  const BannerSectionView({
    Key? key,
  }) : super(key: key);

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.5,
      child: Swiper(
        pagination: const SwiperPagination(margin: EdgeInsets.all(5.0)),
        viewportFraction: 0.8,
        scale: 0.8,
        itemCount: 3,
        outer: true,
        itemHeight: MediaQuery.of(context).size.height / 4,
        itemBuilder: (context, index) => Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(
            'assets/images/banner_image.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class AppBarIconItemView extends StatelessWidget {
  const AppBarIconItemView({
    Key? key,
    required this.icon,
    this.onTapIcon,
  }) : super(key: key);

  final IconData icon;
  final Function? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTapIcon != null) {
          onTapIcon!();
        }
      },
      child: Icon(
        icon,
        shadows: [
          const Shadow(
            color: MOVIE_PAGE_ICON_SHADOW,
          )
        ],
      ),
    );
  }
}
