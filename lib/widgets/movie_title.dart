import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/dimens.dart';

class MovieTitle extends StatelessWidget {
  final String title;
  final FontWeight? fontWeight;
  const MovieTitle({required this.title, this.fontWeight, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: 2,
      style: GoogleFonts.inter(
        fontSize: MARGIN_CARD_MEDIUM_3,
        color: Colors.white,
        fontWeight: fontWeight,
      ),
    );
  }
}
