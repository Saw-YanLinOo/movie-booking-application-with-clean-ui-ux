import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/main.dart';
import 'package:movie_app_view_layer/pages/home_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  MovieModel mMovieModel = MovieModelImpl();

  List<CityVO>? mCityList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mMovieModel.getCity().then((citys) {
      mCityList = citys;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BACKGROUND_COLOR,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Pick Regin',
          style: GoogleFonts.dmSans(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
            child: SearchLocationSection(
              onSend: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const HomePage(),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset('assets/icons/city_icon.png'),
          ),
          Container(
            color: Colors.grey.withOpacity(0.5),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_CARD_MEDIUM_2, vertical: MARGIN_MEDIUM),
            child: Text(
              'Cities',
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Flexible(
            child: mCityList == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : CityListView(
                    mCityList: mCityList,
                    onPressedMovie: (cityId) {
                      _onPressedCity(context, cityId);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  _onPressedCity(BuildContext context, int cityId) {
    mMovieModel.setCity(cityId.toString()).then((value) {
      if (value.code == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      }
    });
  }
}

class CityListView extends StatelessWidget {
  const CityListView({
    Key? key,
    required this.mCityList,
    required this.onPressedMovie,
  }) : super(key: key);

  final List<CityVO>? mCityList;
  final Function(int) onPressedMovie;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var city = mCityList?[index];

        return ListTile(
          onTap: () {
            onPressedMovie(city?.id ?? 0);
          },
          title: Text(
            city?.name ?? '',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        );
      },
      itemCount: mCityList?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Colors.grey,
        );
      },
    );
  }
}

class SearchLocationSection extends StatelessWidget {
  const SearchLocationSection({
    Key? key,
    required this.onSend,
  }) : super(key: key);

  final Function() onSend;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 1.5,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey.withOpacity(0.5),
                Colors.grey.withOpacity(0.3),
              ],
            ),
          ),
          child: const TextField(
            cursorColor: Colors.grey,
            style: TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: 'Search your location',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: PRIMARY_COLOR,
              ),
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
        SizedBox(
          width: MARGIN_CARD_MEDIUM,
        ),
        GestureDetector(
          onTap: onSend,
          child: Container(
            padding: const EdgeInsets.all(MARGIN_MEDIUM_2),
            decoration: BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
            child: const Center(
              child: Icon(
                Icons.send,
                size: MARGIN_MEDIUM_2,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
