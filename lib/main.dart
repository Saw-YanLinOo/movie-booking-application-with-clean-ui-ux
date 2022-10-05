import 'package:flutter/material.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/pages/logo_page.dart';
import 'package:movie_app_view_layer/resources/colors.dart';

void main() {
  MovieModelImpl().getConfig();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
      ),
      debugShowCheckedModeBanner: false,
      home: const LogoPage(),
    );
  }
}
