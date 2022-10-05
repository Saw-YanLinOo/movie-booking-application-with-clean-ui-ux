import 'package:flutter/material.dart';
import 'package:movie_app_view_layer/data/vos/check_out_data_vo.dart';
import 'package:movie_app_view_layer/pages/payment_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';
import 'package:movie_app_view_layer/resources/strings.dart';
import 'package:movie_app_view_layer/widgets/booking_button_view.dart';

import '../viewitems/check_out_ticket_view.dart';
import '../widgets/checkout_title.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key, this.checkOutData}) : super(key: key);

  final CheckOutDataVO? checkOutData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: BACKGROUND_COLOR,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
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
            child: CheckOutTicketView(checkOutData: checkOutData),
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
                  builder: (_) => PaymentPage(checkOutData: checkOutData),
                ),
              );
            },
          ),
          const SizedBox(
            height: MARGIN_CARD_MEDIUM,
          ),
        ],
      ),
    );
  }
}
