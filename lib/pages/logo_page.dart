import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/pages/login_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: GestureDetector(
        onTap: () {
          Timer(const Duration(seconds: 1), () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          });
        },
        child: Center(
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
      ),
    );
  }
}
