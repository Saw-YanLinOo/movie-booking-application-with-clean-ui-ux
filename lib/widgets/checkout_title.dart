import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/dimens.dart';

class CheckOutTitle extends StatelessWidget {
  const CheckOutTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.dmSans(
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
