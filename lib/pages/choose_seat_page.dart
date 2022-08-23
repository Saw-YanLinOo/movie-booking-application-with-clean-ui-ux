import 'package:flutter/material.dart';
import 'package:movie_app_view_layer/pages/food_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/widgets/booking_button_view.dart';

class ChooseSeatPage extends StatelessWidget {
  const ChooseSeatPage({Key? key}) : super(key: key);

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
                builder: (_) => const FoodPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
