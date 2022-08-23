import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resources/dimens.dart';

class LocationText extends StatelessWidget {
  const LocationText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Transform.rotate(
        angle: MARGIN_CARD_MEDIUM_2,
        child: Icon(
          Icons.send_sharp,
          size: 15,
        ),
      ),
      SizedBox(
        width: MARGIN_SMALL,
      ),
      Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
      ),
    ]);
  }
}
