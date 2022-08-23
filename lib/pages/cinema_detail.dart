import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

class CinemaDetail extends StatelessWidget {
  const CinemaDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final facilityList = [
      {
        "title": "Parking",
        "icon": Image.asset(
          'assets/icons/parking_icon.png',
          color: PRIMARY_COLOR,
        ),
      },
      {
        "title": "Online Food",
        "icon": Icon(
          Icons.fastfood_outlined,
          color: PRIMARY_COLOR,
          size: MARGIN_MEDIUM_3,
        ),
      },
      {
        "title": "Wheel Chair",
        "icon": Icon(
          Icons.wheelchair_pickup,
          color: PRIMARY_COLOR,
          size: MARGIN_MEDIUM_3,
        ),
      },
      {
        "title": "Ticket Cancelation",
        "icon": Image.asset(
          'assets/icons/ticket_cancel_icon.png',
        ),
      }
    ];
    final safetyList = [
      'Thermanal Scannig',
      'Contactless Security Check',
      'Santization Before Every Show',
      'Disposable 3D glass',
      'Contactless Food Serviec',
      'Package Food',
      'Deep Cleaning of rest room'
    ];
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BACKGROUND_COLOR,
        centerTitle: true,
        title: Text(
          'Cinema Details',
          style: GoogleFonts.dmSans(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: const [
          Icon(
            Icons.star_border_rounded,
            size: MARGIN_XL_LARGE,
          ),
          SizedBox(
            width: MARGIN_MEDIUM,
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          const CinemaDetailImageSection(),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_CARD_MEDIUM,
                  vertical: MARGIN_CARD_MEDIUM,
                ),
                child: Text(
                  'JCGV : Junction City',
                  style: GoogleFonts.inter(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_CARD_MEDIUM,
                  vertical: MARGIN_CARD_MEDIUM,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Text(
                        'Q5H3+JPP, Corner of, Bogyoke Lann, Yangon ',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: TEXT_REGULAR_3X,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.send,
                      color: PRIMARY_COLOR,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_CARD_MEDIUM,
                  vertical: MARGIN_CARD_MEDIUM,
                ),
                child: const FacilitiesSectionView(),
              ),
              const SizedBox(
                height: MARGIN_XL_LARGE,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_CARD_MEDIUM,
                  vertical: MARGIN_CARD_MEDIUM,
                ),
                child: SafetySection(safetyList: safetyList),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class SafetySection extends StatelessWidget {
  const SafetySection({
    Key? key,
    required this.safetyList,
  }) : super(key: key);

  final List<String> safetyList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Safety',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Wrap(
          children: safetyList
              .map((e) => Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: MARGIN_MEDIUM,
                      vertical: MARGIN_SMALL,
                    ),
                    padding: const EdgeInsets.all(MARGIN_SMALL),
                    decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(MARGIN_SMALL),
                    ),
                    child: Text(
                      e,
                      style: GoogleFonts.inter(
                        fontSize: TEXT_REGULAR,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class FacilitiesSectionView extends StatelessWidget {
  const FacilitiesSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Facilities',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
          ),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Wrap(
          spacing: MARGIN_MEDIUM,
          children: [
            FacilitiesItemView(
              icon: Image.asset(
                'assets/icons/parking_icon.png',
                color: PRIMARY_COLOR,
              ),
              title: "Parking",
            ),
            FacilitiesItemView(
              icon: Icon(
                Icons.fastfood_outlined,
                color: PRIMARY_COLOR,
                size: MARGIN_MEDIUM_3,
              ),
              title: "Online Food",
            ),
            FacilitiesItemView(
              icon: Icon(
                Icons.wheelchair_pickup,
                color: PRIMARY_COLOR,
                size: MARGIN_MEDIUM_3,
              ),
              title: "Wheel Chair",
            ),
            FacilitiesItemView(
              icon: Image.asset(
                'assets/icons/ticket_cancel_icon.png',
              ),
              title: "Ticket Cancelation",
            ),
          ],
        ),
      ],
    );
  }
}

class FacilitiesItemView extends StatelessWidget {
  const FacilitiesItemView({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Widget icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        SizedBox(
          width: MARGIN_SMALL,
        ),
        Text(
          title,
          style: GoogleFonts.inter(
            color: PRIMARY_COLOR,
            fontSize: TEXT_REGULAR,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class CinemaDetailImageSection extends StatelessWidget {
  const CinemaDetailImageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: PROFILE_PAGE_SLIVER_APP_BAR_HEIGHT,
      backgroundColor: BACKGROUND_COLOR,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.asset('assets/images/cinema_image.png'),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: MARGIN_XXL_LARGE,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
