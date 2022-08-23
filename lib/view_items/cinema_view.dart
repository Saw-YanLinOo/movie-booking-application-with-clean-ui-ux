import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/cinema_detail.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class CinemaView extends StatelessWidget {
  final Function onSelectTime;

  const CinemaView(
    this.onSelectTime, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: CinemaTitleView(),
      trailing: SizedBox(),
      subtitle: CinemaSubTitleView(),
      children: [
        CinemaExpandedView(() {
          onSelectTime();
        }),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3, vertical: MARGIN_MEDIUM),
          child: AdditionInfoView(() {
            _showTernsAndCondition(context);
          }),
        )
      ],
    );
  }

  _showTernsAndCondition(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: BACKGROUND_COLOR,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Terms and Conditions',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: MARGIN_CARD_MEDIUM,
                ),
                AlertDialogText(
                    '1. Ticket is compulsory for children of 5 years & above.'),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                AlertDialogText(
                    '2. Person below the age of 18 years cannot be admitted for movies certified `A`.'),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                AlertDialogText(
                    '3. Items like laptops, cameras, knives, lighter, match box , cigarettes, firearms and all types of inflammable objects are strictly prohibited.'),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                AlertDialogText(
                    '4. Items like carry-bags eatables , helmets , handbags are not allowed inside the theatres and are strictly prohibited. Kindly deposit at the baggage counter of mall/cinema.'),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                AlertDialogText(
                    '5. For 3D movies, ticket price includes charges towards usage of 3D glasses.'),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                AlertDialogText(
                    '6. Seat Layout Page for PVR Cinemas is for representational purpose only and actual seat layout might vary.'),
                SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Center(
                  child: Container(
                    width: 100,
                    height: 80,
                    child: Image.asset(
                        'assets/images/choose_cinema_terns_image.png'),
                  ),
                ),
                SizedBox(
                  height: MARGIN_CARD_MEDIUM,
                ),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FlatButton(
                        onPressed: () {},
                        color: BACKGROUND_COLOR,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: PRIMARY_COLOR,
                          ),
                          borderRadius: BorderRadius.circular(
                            MARGIN_SMALL,
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.inter(
                            fontSize: TEXT_REGULAR,
                            fontWeight: FontWeight.w700,
                            color: PRIMARY_COLOR,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MARGIN_MEDIUM_2,
                      ),
                      FlatButton(
                        color: PRIMARY_COLOR,
                        onPressed: () {},
                        child: Text(
                          "Accept",
                          style: GoogleFonts.inter(
                            fontSize: TEXT_REGULAR,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class AlertDialogText extends StatelessWidget {
  final String title;
  const AlertDialogText(
    this.title, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: TEXT_SMALL,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class AdditionInfoView extends StatelessWidget {
  final Function onLongPress;

  const AdditionInfoView(
    this.onLongPress, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        onLongPress();
      },
      child: Row(
        children: [
          SizedBox(
            width: MARGIN_MEDIUM_2,
            child: Image.asset('assets/icons/info_icon.png'),
          ),
          SizedBox(
            width: MARGIN_MEDIUM,
          ),
          Text(
            'Long press on show timing to see seat class!',
            style: GoogleFonts.inter(
              fontSize: TEXT_REGULAR,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

class CinemaExpandedView extends StatelessWidget {
  final Function onSelectTime;
  const CinemaExpandedView(
    this.onSelectTime, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colors = [
      Colors.grey,
      PRIMARY_COLOR,
      AVAILABLE_ITEM_COLOR_TWO,
      AVAILABLE_ITEM_COLOR_THREE,
      Colors.amber,
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 0.8,
      ),
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            onSelectTime();
          },
          // child: Container(
          //   decoration: BoxDecoration(
          //     gradient:
          //         SweepGradient(colors: [PRIMARY_COLOR, BACKGROUND_COLOR]),
          //     borderRadius: BorderRadius.circular(
          //       MARGIN_SMALL,
          //     ),
          //     shape: BoxShape.rectangle,
          //     border: BoxBorder()
          //   ),
          // ),
          child: Chip(
            label: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '12:30 PM',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '3D IMAX',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: TEXT_SMALL,
                  ),
                ),
                Text(
                  'Screen 1',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: TEXT_SMALL,
                  ),
                ),
              ],
            ),
            labelPadding: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM,
              vertical: MARGIN_MEDIUM_2,
            ),
            backgroundColor: BACKGROUND_COLOR.withOpacity(0.9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                MARGIN_SMALL,
              ),
            ),
            side: BorderSide(
              color: colors[index],
            ),
          ),
        );
      },
    );
  }
}

class CinemaSubTitleView extends StatelessWidget {
  const CinemaSubTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton.icon(
          onPressed: null,
          icon: SizedBox(
            width: MARGIN_MEDIUM_2,
            height: MARGIN_MEDIUM_2,
            child: Image.asset(
              'assets/icons/parking_icon.png',
            ),
          ),
          label: Text(
            'Parking',
            style: GoogleFonts.inter(
              color: MOVIE_PAGE_TEXT_COLOR,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: null,
          icon: const Icon(
            Icons.fastfood_outlined,
            color: MOVIE_PAGE_TEXT_COLOR,
            size: MARGIN_MEDIUM_2,
          ),
          label: Text(
            'Online Food',
            style: GoogleFonts.inter(
              color: MOVIE_PAGE_TEXT_COLOR,
            ),
          ),
        ),
        TextButton.icon(
          onPressed: null,
          icon: const Icon(
            Icons.wheelchair_pickup,
            color: MOVIE_PAGE_TEXT_COLOR,
            size: MARGIN_MEDIUM_2,
          ),
          label: Text(
            'Wheel Chair',
            style: GoogleFonts.inter(
              color: MOVIE_PAGE_TEXT_COLOR,
            ),
          ),
        ),
      ],
    );
  }
}

class CinemaTitleView extends StatelessWidget {
  const CinemaTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'JCGV: Junction City',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const CinemaDetail(),
              ),
            );
          },
          child: Text(
            'See Details',
            style: GoogleFonts.inter(
              color: PRIMARY_COLOR,
              fontSize: TEXT_SMALL,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
