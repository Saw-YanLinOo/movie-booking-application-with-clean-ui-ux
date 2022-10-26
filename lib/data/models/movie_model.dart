import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/data/vos/payment_vo.dart';
import 'package:movie_app_view_layer/data/vos/user_vo.dart';
import 'package:movie_app_view_layer/network/responses/check_out_response.dart';
import 'package:movie_app_view_layer/network/responses/get_otp_response.dart';
import 'package:movie_app_view_layer/network/responses/sign_in_with_phone_response.dart';

import '../../network/requests/check_out_request.dart';
import '../vos/banner_vo.dart';
import '../vos/credit_vo.dart';
import '../vos/movie_vo.dart';
import '../vos/snack_category_vo.dart';
import '../vos/snack_vo.dart';

abstract class MovieModel {
  // Network
  Future<GetOtpResponse> getOtp(String phone);
  Future<SignInWithPhoneResponse> signInWithPhone(String phone, String otp);
  void getCity();
  Future<GetOtpResponse> setCity(String cityId);
  void getBanner();
  void getNowPlayingMovie(String page);
  void getUpCommingMovie(String page);
  void getMovieDetail(int movieId);
  void getCreditsByMovie(int movieId);
  void getConfig();
  void getCinema(String date);
  void getCinemaTimeSlot(String date);
  void getSnackCategory();
  void getSnack(int categoryId);
  void getPaymentType();
  Future<CheckOutResponse> checkOut(CheckOutRequest checkOutRequest);

  // Database
  Future<List<ConfigVO>?> getConfigFromDatabase();
  Stream<UserVo?> getUserFromDatabase();
  Stream<List<CityVO>?> getCityFromDatabase();
  Stream<List<BannerVO>?> getBannerFromDatabase();
  Stream<List<MovieVO>?> getNowPlayingMovieFromDatabase();
  Stream<List<MovieVO>?> getUpCommingMovieFromDatabase();
  Stream<MovieVO?> getMovieDetailFromDatabase(int movieId);
  Stream<List<CreditVO>?> getCreditsByMovieIdFromDatabase(int movieId);
  Stream<List<CinemaVO>?> getCinemaAndTimeSlotByDateFromDatabase(String date);
  Stream<List<SnackCategoryVO>?> getSnackCategoryFromDatabase();
  Stream<List<SnackVO>?> getSnackByCatIdFromDatabase(int categoryId);
  Stream<List<PaymentVO>?> getPaymentTypeFromDatabase();
}
