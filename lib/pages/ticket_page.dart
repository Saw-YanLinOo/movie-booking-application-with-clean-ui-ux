import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/ticket_detail_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';
import 'package:movie_app_view_layer/resources/strings.dart';
import 'package:movie_app_view_layer/view_items/ticket_view.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: BACKGROUND_COLOR,
        title: Text(
          YOUR_TICKET_TEXT,
          style: GoogleFonts.dmSans(
            fontSize: TEXT_HEADING_1X,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return TicketView(
            onTapTicket: () {
              _goToDetailPage(context);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: MARGIN_CARD_MEDIUM,
          );
        },
      ),
    );
  }
}

void _goToDetailPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const TicketDetailPage(),
    ),
  );
}
