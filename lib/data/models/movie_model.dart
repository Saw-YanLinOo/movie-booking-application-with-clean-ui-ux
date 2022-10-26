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
  Future<List<CityVO>?> getCity();
  Future<GetOtpResponse> setCity(String cityId);
  Future<List<BannerVO>?> getBanner();
  Future<List<MovieVO>?> getNowPlayingMovie(String page);
  Future<List<MovieVO>?> getUpCommingMovie(String page);
  Future<MovieVO?> getMovieDetail(String movieId);
  Future<List<CreditVO>?> getCreditsByMovie(String movieId);
  Future<List<ConfigVO>?> getConfig();
  Future<List<CinemaVO>?> getCinema(String date);
  Future<List<SnackCategoryVO>?> getSnackCategory();
  Future<List<SnackVO>?> getSnack(String categoryId);
  Future<List<PaymentVO>?> getPaymentType();
  Future<List<CinemaVO>?> getCinemaTimeSlot(String date);
  Future<CheckOutResponse> checkOut(CheckOutRequest checkOutRequest);

  // Database
  Future<List<ConfigVO>?> getConfigFromDatabase();
  Future<UserVo?> getUserFromDatabase();
  Future<List<CityVO>?> getCityFromDatabase();
  Future<List<BannerVO>?> getBannerFromDatabase();
  Future<List<MovieVO>?> getNowPlayingMovieFromDatabase();
  Future<List<MovieVO>?> getUpCommingMovieFromDatabase();
  Future<MovieVO?> getMovieDetailFromDatabase(int movieId);
  Future<List<CreditVO>?> getCreditsByMovieIdFromDatabase(int movieId);
  Future<List<CinemaVO>?> getCinemaAndTimeSlotByDateFromDatabase(String date);
  Future<List<SnackCategoryVO>?> getSnackCategoryFromDatabase();
  Future<List<SnackVO>?> getSnackByCatIdFromDatabase(int categoryId);
  Future<List<PaymentVO>?> getPaymentTypeFromDatabase();
}
