import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/main.dart';
import 'package:movie_app_view_layer/pages/movie_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

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
          SizedBox(
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
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text(
                    'Yangon',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              },
              itemCount: 7,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.grey,
                );
              },
            ),
          ),
        ],
      ),
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
