import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/resources/colors.dart';

import '../resources/dimens.dart';

class BookingButtonView extends StatelessWidget {
  final String title;
  final Function onTapBooking;

  const BookingButtonView({
    required this.title,
    required this.onTapBooking,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBooking();
      },
      child: Container(
        width: 200,
        height: 50,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/btn_booking_background.png',
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: MARGIN_MEDIUM_2,
                  fontWeight: FontWeight.w700,
                  color: BACKGROUND_COLOR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
