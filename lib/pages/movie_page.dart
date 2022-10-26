import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/data/vos/banner_vo.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/pages/movie_detail_page.dart';
import 'package:movie_app_view_layer/pages/search_movie_page.dart';
import 'package:movie_app_view_layer/resources/strings.dart';
import 'package:movie_app_view_layer/widgets/icon.dart';
import 'package:movie_app_view_layer/widgets/location_text.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../viewitems/movie_view.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController _tabController;
  MovieModel mMovieModel = MovieModelImpl();

  List<BannerVO>? mBannerList;
  List<MovieVO>? mNowShowingMovie;
  List<MovieVO>? mCommingSoonMovie;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);

    _getBanner();
    _getNowShowingMovie();
  }

  // Banner
  _getBanner() {
    mMovieModel.getBannerFromDatabase().listen((bannerList) {
      mBannerList = bannerList;
      setState(() {});
    });
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
          BannerSectionView(
            mBannerList: mBannerList,
          ),
          const SizedBox(
            height: MARGIN_SMALL,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
            ),
            child: SelectMovieSection(
              tabController: _tabController,
              onTapMovie: (value) {
                index = value;
                if (value == 0) {
                  _getNowShowingMovie();
                } else {
                  _getCommingSoonMovie();
                }
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
              selectedIndex: index,
              index == 0 ? mNowShowingMovie : mCommingSoonMovie,
              onTapMovie: (movie) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MovieDetailPage(
                      movie: movie,
                      index: index,
                    ),
                  ),
                );
              },
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
    this.selectedIndex,
    required this.onTapMovie,
  }) : super(key: key);

  final List<MovieVO>? movieList;
  final int? selectedIndex;
  final Function(MovieVO) onTapMovie;

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
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var movie = movieList?[index] ?? MovieVO();
              return MovieItemView(
                index: selectedIndex,
                movie: movie,
                onPressedMovie: () {
                  onTapMovie(movie);
                },
              );
            },
          );
  }
}

class SelectMovieSection extends StatelessWidget {
  const SelectMovieSection({
    required this.tabController,
    required this.onTapMovie,
    Key? key,
  }) : super(key: key);
  final TabController tabController;
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
      child: TabBar(
        onTap: onTapMovie,
        controller: tabController,
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
    );
  }
}

class BannerSectionView extends StatelessWidget {
  const BannerSectionView({
    this.mBannerList,
    Key? key,
  }) : super(key: key);

  final List<BannerVO>? mBannerList;
  @override
  Widget build(BuildContext context) {
    return mBannerList == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
            child: Swiper(
              pagination: const SwiperPagination(margin: EdgeInsets.all(5.0)),
              viewportFraction: 0.8,
              scale: 0.8,
              itemCount: mBannerList?.length ?? 0,
              outer: true,
              itemHeight: MediaQuery.of(context).size.height / 4,
              itemBuilder: (context, index) {
                final banner = mBannerList?[index];
                return Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.network(
                    '${banner?.url}',
                    fit: BoxFit.cover,
                  ),
                );
              },
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
