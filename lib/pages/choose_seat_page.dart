import 'package:flutter/material.dart';
import 'package:movie_app_view_layer/data/vos/check_out_data_vo.dart';
import 'package:movie_app_view_layer/pages/food_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/widgets/booking_button_view.dart';

import '../data/vos/cinema_vo.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key, this.checkOutData}) : super(key: key);

  final CheckOutDataVO? checkOutData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Center(
        child: BookingButtonView(
          title: 'Buy Ticket',
          onTapBooking: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => FoodPage(checkOutData: checkOutData),
              ),
            );
          },
        ),
      ),
    );
  }
}
