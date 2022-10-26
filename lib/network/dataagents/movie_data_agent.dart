import 'package:movie_app_view_layer/data/vos/check_out_vo.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/data/vos/payment_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_category_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_vo.dart';
import 'package:movie_app_view_layer/network/requests/check_out_request.dart';
import 'package:movie_app_view_layer/network/responses/check_out_response.dart';
import 'package:movie_app_view_layer/network/responses/city_list_response.dart';
import 'package:movie_app_view_layer/network/responses/get_credits_by_movie_response.dart';
import 'package:movie_app_view_layer/network/responses/get_otp_response.dart';
import 'package:movie_app_view_layer/network/responses/sign_in_with_phone_response.dart';
import 'package:movie_app_view_layer/network/responses/snack_category_list_response.dart';

import '../../data/vos/banner_vo.dart';
import '../../data/vos/cinema_vo.dart';
import '../../data/vos/config_vo.dart';
import '../../data/vos/credit_vo.dart';

abstract class MovieDataAgent {
  Future<GetOtpResponse> getOtp(String phone);
  Future<SignInWithPhoneResponse> singInWithPhone(String phone, String otp);
  Future<List<CityVO>?> getCity();
  Future<GetOtpResponse> setCity(String token, String cityId);
  Future<List<BannerVO>?> getBanner();
  Future<List<MovieVO>?> getNowPlayingMovie(String page);
  Future<List<MovieVO>?> getUpCommingMovie(String page);
  Future<MovieVO?> getMovieDetail(String movieId);
  Future<GetCreditsByMovieResponse> getCreditsByMovie(String movieId);
  Future<List<ConfigVO>?> getConfig();
  Future<List<CinemaVO>?> getCinema(String time);
  Future<List<SnackCategoryVO>?> getSnackCategory(String token);
  Future<List<SnackVO>?> getSnack(String token, String categoryId);
  Future<List<PaymentVO>?> getPaymentType(String token);
  Future<List<CinemaVO>?> getCinemaTimeSlot(
      String token, String date);
  Future<CheckOutResponse> checkOut(String token, CheckOutRequest checkOutRequest);
}
