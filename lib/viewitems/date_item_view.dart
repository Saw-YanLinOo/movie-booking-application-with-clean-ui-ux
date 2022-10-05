import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class DateSectionView extends StatelessWidget {
  const DateSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        DateItemView(
            icon: Icons.calendar_month, description: 'Sat, 18 Jun, 2022'),
        DateItemView(icon: Icons.timer, description: '3:30 PM'),
        DateItemView(
            icon: Icons.location_pin,
            description: 'Q5H3+JPP, Corner of, Bogyoke Lann, Yangon'),
      ],
    );
  }
}

class DateItemView extends StatelessWidget {
  const DateItemView({
    Key? key,
    required this.icon,
    required this.description,
  }) : super(key: key);

  final IconData icon;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: CHECKOUT_DATE_ITEM_WIDTH,
      child: Column(
        children: [
          Icon(
            icon,
            color: PRIMARY_COLOR,
            size: MARGIN_LARGE,
          ),
          SizedBox(
            height: MARGIN_CARD_MEDIUM,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.dmSans(
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}