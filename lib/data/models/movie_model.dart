import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/data/vos/payment_vo.dart';
import 'package:movie_app_view_layer/network/responses/check_out_response.dart';
import 'package:movie_app_view_layer/network/responses/get_otp_response.dart';
import 'package:movie_app_view_layer/network/responses/sign_in_with_phone_response.dart';

import '../../network/requests/check_out_request.dart';
import '../vos/banner_vo.dart';
import '../vos/check_out_vo.dart';
import '../vos/cinema_and_time_slot_vo.dart';
import '../vos/credit_vo.dart';
import '../vos/movie_vo.dart';
import '../vos/snack_category_vo.dart';
import '../vos/snack_vo.dart';

abstract class MovieModel {
  List<ConfigVO>? configs = [];
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
  Future<List<CinemaVO>?> getCinema(String time);
  Future<List<SnackCategoryVO>?> getSnackCategory();
  Future<List<SnackVO>?> getSnack(String categoryId);
  Future<List<PaymentVO>?> getPaymentType();
  Future<List<CinemaAndTimeSlotVO>?> getCinemaTimeSlot(String date);
  Future<CheckOutResponse> checkOut(CheckOutRequest checkOutRequest);
}
