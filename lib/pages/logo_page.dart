import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/pages/home_page.dart';
import 'package:movie_app_view_layer/pages/login_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';
import 'package:movie_app_view_layer/resources/dimens.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  MovieModel mMovieModel = MovieModelImpl();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    mMovieModel.getUserFromDatabase().then((user) {
      if (user?.token != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false,
        );
      } else {
        Timer(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LoginPage()),
            (route) => false,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
