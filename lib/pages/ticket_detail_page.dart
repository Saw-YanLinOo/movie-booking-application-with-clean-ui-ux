import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/resources/strings.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../view_items/check_out_ticket_view.dart';

class TicketDetailPage extends StatelessWidget {
  const TicketDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: BACKGROUND_COLOR,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          TICKET_DETAIL_TEXT,
          style: GoogleFonts.dmSans(
            fontSize: TEXT_HEADING_1X,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
            ),
            child: const CheckOutTicketView(),
          ),
          const SizedBox(
            height: MARGIN_XL_LARGE,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_3,
            ),
            child: const CancelSectionView(),
          ),
        ],
      ),
    );
  }
}

class CancelSectionView extends StatelessWidget {
  const CancelSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Refund Amount',
              style: GoogleFonts.inter(
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              '1500Ks',
              style: GoogleFonts.inter(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w700,
                color: Colors.red,
              ),
            ),
          ],
        ),
        Container(
          width: 220,
          height: 50,
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/btn_booking_background.png',
                  color: Colors.red,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Cancel Booking',
                  style: GoogleFonts.inter(
                    fontSize: MARGIN_MEDIUM_2,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
