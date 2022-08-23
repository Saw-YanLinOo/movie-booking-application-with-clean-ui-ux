import 'package:flutter/material.dart';
import 'package:movie_app_view_layer/pages/payment_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';
import 'package:movie_app_view_layer/resources/strings.dart';
import 'package:movie_app_view_layer/widgets/booking_button_view.dart';

import '../view_items/check_out_ticket_view.dart';
import '../widgets/checkout_title.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BACKGROUND_COLOR,
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        centerTitle: true,
        title: const CheckOutTitle(title: CHECKOUT_TEXT),
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
          BookingButtonView(
            title: CONTINUE_TEXT,
            onTapBooking: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PaymentPage(),
                ),
              );
            },
          ),
          SizedBox(
            height: MARGIN_CARD_MEDIUM,
          ),
        ],
      ),
    );
  }
}
