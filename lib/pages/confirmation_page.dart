import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/vos/check_out_data_vo.dart';
import 'package:movie_app_view_layer/data/vos/check_out_vo.dart';
import 'package:movie_app_view_layer/pages/home_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

import '../network/api_constants.dart';
import '../resources/strings.dart';
import '../viewitems/ticket_view.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({
    Key? key,
    this.checkOut,
    this.checkOutData,
  }) : super(key: key);

  final CheckOutVO? checkOut;
  final CheckOutDataVO? checkOutData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: BACKGROUND_COLOR,
        title: Text(
          TICKET_CONFIRM_TEXT,
          style: GoogleFonts.dmSans(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MARGIN_LARGE,
            ),
            TicketView(checkOut: checkOut, checkOutData: checkOutData),
            SizedBox(
              height: MARGIN_XXXL_LARGE,
            ),
            QRCode(qrCode: checkOut?.qrCode),
            SizedBox(
              height: MARGIN_XXXL_LARGE,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: PRIMARY_COLOR,
                padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_3,
                  vertical: MARGIN_MEDIUM_2,
                ),
              ),
              onPressed: () {
                _onDonePress(context);
              },
              child: Text(
                "DONE",
                style: GoogleFonts.inter(
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_LARGE,
            ),
          ],
        ),
      ),
    );
  }

  void _onDonePress(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.1),
            content: Column(
              children: [
                Image.asset(CONFIRM_PAGE_ILLUSTRATION_IMAGE),
                const SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Text(
                  BOOKING_SUCCESS_TEXT,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.beVietnamPro(
                    color: Colors.white,
                    fontSize: TEXT_HEADING_2X,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          );
        });
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()),
        (route) => false,
      );
    });
  }
}

class QRCode extends StatelessWidget {
  const QRCode({
    Key? key,
    this.qrCode,
  }) : super(key: key);

  final String? qrCode;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network('$QR_IMAGE_BASE_URL/${qrCode}'),
        SizedBox(
          height: MARGIN_CARD_MEDIUM_3,
        ),
        Text(
          'WAG5LP1C',
          style: GoogleFonts.dmSans(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Text.rich(
          TextSpan(children: <InlineSpan>[
            TextSpan(
              text: 'TPIN : ',
              style: GoogleFonts.dmSans(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: 'WKCSL96',
              style: GoogleFonts.dmSans(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
