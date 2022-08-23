import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movie_app_view_layer/resources/colors.dart';

import '../resources/dimens.dart';
import '../widgets/search_drop_down_view.dart';
import 'choose_cinema_page.dart';

class SearchCinemaPage extends StatefulWidget {
  const SearchCinemaPage({Key? key}) : super(key: key);

  @override
  State<SearchCinemaPage> createState() => _SearchCinemaPageState();
}

class _SearchCinemaPageState extends State<SearchCinemaPage> {
  var priceRange = const RangeValues(3500, 10000);
  var timeRange = const RangeValues(8, 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BACKGROUND_COLOR,
        title: const TextField(
          cursorColor: Colors.grey,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: ' search the movie',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: SizedBox(
              width: MARGIN_MEDIUM_2,
              height: MARGIN_MEDIUM_2,
              child: Icon(
                Icons.filter_alt,
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
          SizedBox(height: MARGIN_LARGE),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_LARGE,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price Range",
                  style: GoogleFonts.inter(
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '3500Ks',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '29500Ks',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                RangeSlider(
                  min: 3500,
                  max: 29500,
                  onChanged: (value) {
                    priceRange = value;

                    setState(() {});
                  },
                  values: priceRange,
                  activeColor: PRIMARY_COLOR,
                  labels:
                      RangeLabels('${priceRange.start}', '${priceRange.end}'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_LARGE,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Show Time",
                  style: GoogleFonts.inter(
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '8am',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      '12pm',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                RangeSlider(
                  min: 8,
                  max: 12,
                  onChanged: (value) {
                    timeRange = value;

                    setState(() {});
                  },
                  values: timeRange,
                  activeColor: PRIMARY_COLOR,
                  labels: RangeLabels('${timeRange.start}', '${timeRange.end}'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM_3,
          ),
          const Expanded(
            child: CinemaListViewSection(),
          ),
        ],
      ),
    );
  }
}
