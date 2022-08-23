import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class FoodView extends StatelessWidget {
  const FoodView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          MARGIN_MEDIUM_2,
        ),
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg_food_view.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(
          MARGIN_MEDIUM_2,
        ),
        child: Column(
          children: [
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            Image.asset('assets/images/sweet_potato.png'),
            SizedBox(
              height: MARGIN_CARD_MEDIUM_3,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Potatoe Chips',
                style: GoogleFonts.inter(
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_SMALL,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '1000 KS',
                style: GoogleFonts.inter(
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w700,
                  color: PRIMARY_COLOR,
                ),
              ),
            ),
            SizedBox(
              height: MARGIN_MEDIUM,
            ),
            FlatButton(
              minWidth: FOOD_CARD_BUTTON_WIDTH,
              color: PRIMARY_COLOR,
              onPressed: () {},
              child: Text(
                'ADD',
                style: GoogleFonts.inter(
                  fontSize: TEXT_REGULAR,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
