import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/dimens.dart';

class MovieTitle extends StatelessWidget {
  final String title;
  final FontWeight fontWeight;
  const MovieTitle({required this.title,required this.fontWeight, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: MARGIN_CARD_MEDIUM_3,
        color: Colors.white,
        fontWeight: fontWeight,
      ),
    );
  }
}
