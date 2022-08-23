import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/location_page.dart';
import 'package:movie_app_view_layer/pages/login_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/icons/logo_icon.png'),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'C',
                  style: GoogleFonts.inter(
                    color: PRIMARY_COLOR,
                    fontSize: TEXT_REGULAR_3X,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  ' cinema',
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
