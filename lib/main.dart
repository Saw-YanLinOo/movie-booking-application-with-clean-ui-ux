import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app_view_layer/data/models/movie_model_impl.dart';
import 'package:movie_app_view_layer/data/vos/banner_vo.dart';
import 'package:movie_app_view_layer/data/vos/check_out_vo.dart';
import 'package:movie_app_view_layer/data/vos/cinema_list_vo.dart';
import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/data/vos/collection_vo.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_list_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';
import 'package:movie_app_view_layer/data/vos/date_vo.dart';
import 'package:movie_app_view_layer/data/vos/facilities_vo.dart';
import 'package:movie_app_view_layer/data/vos/genre_vo.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/data/vos/production_company_vo.dart';
import 'package:movie_app_view_layer/data/vos/production_country_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_vo.dart';
import 'package:movie_app_view_layer/data/vos/spoken_language_vo.dart';
import 'package:movie_app_view_layer/data/vos/time_slot_vo.dart';
import 'package:movie_app_view_layer/data/vos/user_vo.dart';
import 'package:movie_app_view_layer/pages/logo_page.dart';
import 'package:movie_app_view_layer/persistence/hive_constants.dart';
import 'package:movie_app_view_layer/resources/colors.dart';

import 'data/vos/payment_vo.dart';
import 'data/vos/snack_category_vo.dart';

void main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BannerVOAdapter());
  Hive.registerAdapter(CheckOutVOAdapter());
  Hive.registerAdapter(CinemaVOAdapter());
  Hive.registerAdapter(CinemaListVOAdapter());
  Hive.registerAdapter(CityVOAdapter());
  Hive.registerAdapter(CollectionVOAdapter());
  Hive.registerAdapter(ConfigVOAdapter());
  Hive.registerAdapter(CreditVOAdapter());
  Hive.registerAdapter(CreditListVOAdapter());
  Hive.registerAdapter(DateVOAdapter());
  Hive.registerAdapter(FacilitiesVOAdapter());
  Hive.registerAdapter(GenreVOAdapter());
  Hive.registerAdapter(MovieVOAdapter());
  Hive.registerAdapter(PaymentVOAdapter());
  Hive.registerAdapter(ProductionCompanyVOAdapter());
  Hive.registerAdapter(ProductionCountryVOAdapter());
  Hive.registerAdapter(SnackCategoryVOAdapter());
  Hive.registerAdapter(SnackVOAdapter());
  Hive.registerAdapter(SpokenLanguageVOAdapter());
  Hive.registerAdapter(TimeSlotVOAdapter());
  Hive.registerAdapter(UserVOAdapter());

  await Hive.openBox<ConfigVO>(BOX_NAME_CONFIG_VO);
  await Hive.openBox<UserVo>(BOX_NAME_USER_VO);
  await Hive.openBox<CityVO>(BOX_NAME_CITY_VO);
  await Hive.openBox<CreditListVO>(BOX_NAME_CREDIT_VO);
  await Hive.openBox<BannerVO>(BOX_NAME_BANNER_VO);
  await Hive.openBox<MovieVO>(BOX_NAME_MOVIE_VO);
  await Hive.openBox<CinemaListVO>(BOX_NAME_CINEMA_VO);
  await Hive.openBox<SnackCategoryVO>(BOX_NAME_SNACK_CATEGORY_VO);
  await Hive.openBox<SnackVO>(BOX_NAME_SNACK_VO);
  await Hive.openBox<PaymentVO>(BOX_NAME_PAYMENT_VO);

  // preload config
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
