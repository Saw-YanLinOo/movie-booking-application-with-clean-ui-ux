import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/search_cinema_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/strings.dart';

import '../resources/dimens.dart';
import '../view_items/cinema_view.dart';
import '../widgets/location_text.dart';
import 'choose_seat_page.dart';

class ChooseCinema extends StatelessWidget {
  const ChooseCinema({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var resulationList = ['2D', '3D', '3D IMAX', '3d DBOX'];

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: BACKGROUND_COLOR,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: LocationText(title: 'Yangon'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SearchCinemaPage(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: MARGIN_MEDIUM_2),
              child: Icon(
                Icons.search,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
            child: SizedBox(
              width: MARGIN_MEDIUM_2,
              height: MARGIN_MEDIUM_2,
              child: Image.asset(
                'assets/icons/filter_icon.png',
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: MARGIN_CARD_MEDIUM_2,
          ),
          Container(
            height: CHOOSE_CINEMA_LIST_DATE_CARD_HEIGHT,
            child: const DateViewSection(),
          ),
          const SizedBox(
            height: MARGIN_LARGE,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM,
            ),
            child: ResulationView(resulationList: resulationList),
          ),
          const SizedBox(
            height: MARGIN_LARGE,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2,
            ),
            color: AVAILABLE_BACKGROUND_COLOR,
            child: const AvailiableView(),
          ),
          const Expanded(
            child: CinemaListViewSection(),
          ),
        ],
      ),
    );
  }
}

class AvailiableView extends StatelessWidget {
  const AvailiableView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const AvailiableItem(
          color: PRIMARY_COLOR,
          title: CINEMA_VIEW_AVAILABLE_TEXT,
        ),
        const AvailiableItem(
          color: AVAILABLE_ITEM_COLOR_TWO,
          title: CINEMA_VIEW_FILLING_FAST_TEXT,
        ),
        const AvailiableItem(
          color: AVAILABLE_ITEM_COLOR_THREE,
          title: CINEMA_VIEW_ALMOST_FULL_TEXT,
        ),
      ],
    );
  }
}

class CinemaListViewSection extends StatelessWidget {
  const CinemaListViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
        return CinemaView(() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ChooseSeatPage()),
          );
        });
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        color: Colors.grey,
      ),
    );
  }
}

class AvailiableItem extends StatelessWidget {
  const AvailiableItem({
    Key? key,
    required this.color,
    required this.title,
  }) : super(key: key);

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Center(
        child: Icon(
          Icons.circle,
          size: MARGIN_MEDIUM,
          color: color,
        ),
      ),
      label: Text(
        title,
        style: GoogleFonts.inter(
          color: color,
          fontSize: MARGIN_MEDIUM_2,
        ),
      ),
    );
  }
}

class ResulationView extends StatelessWidget {
  const ResulationView({
    Key? key,
    required this.resulationList,
  }) : super(key: key);

  final List<String> resulationList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: MARGIN_MEDIUM_3,
      children: resulationList
          .map(
            (e) => Chip(
              label: Text(
                e,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: MARGIN_MEDIUM_2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              backgroundColor: const Color.fromRGBO(85, 85, 85, 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  MARGIN_SMALL,
                ),
              ),
              side: const BorderSide(
                color: Colors.white,
              ),
            ),
          )
          .toList(),
    );
  }
}

class DateViewSection extends StatefulWidget {
  const DateViewSection({
    Key? key,
  }) : super(key: key);

  @override
  State<DateViewSection> createState() => _DateViewSectionState();
}

class _DateViewSectionState extends State<DateViewSection> {
  int indexStack = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(
        left: MARGIN_CARD_MEDIUM_2,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              indexStack = index;
            });
          },
          child: Container(
            width: CHOOSE_CINEMA_DATE_CARD_WIDTH,
            margin: const EdgeInsets.only(
              right: MARGIN_MEDIUM_3,
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/DateCard.png',
                    fit: BoxFit.cover,
                    color: indexStack == index ? PRIMARY_COLOR : null,
                  ),
                ),
                Positioned.fill(
                  child: DateInfoView(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DateInfoView extends StatelessWidget {
  final int index;
  const DateInfoView(
    this.index, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: MARGIN_MEDIUM_2,
        ),
        Text(
          'Today',
          style: GoogleFonts.inter(
            fontSize: MARGIN_MEDIUM_2,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          'May',
          style: GoogleFonts.inter(
            fontSize: MARGIN_MEDIUM_2,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          '$index',
          style: GoogleFonts.inter(
            fontSize: MARGIN_MEDIUM_2,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
