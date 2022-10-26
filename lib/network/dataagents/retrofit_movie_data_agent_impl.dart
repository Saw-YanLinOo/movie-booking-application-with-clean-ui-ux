import 'package:dio/dio.dart';
import 'package:movie_app_view_layer/data/vos/banner_vo.dart';
import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';
import 'package:movie_app_view_layer/data/vos/payment_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_category_vo.dart';
import 'package:movie_app_view_layer/network/api_constants.dart';
import 'package:movie_app_view_layer/network/custom_log_interceptor.dart';
import 'package:movie_app_view_layer/network/dataagents/movie_data_agent.dart';
import 'package:movie_app_view_layer/network/movie_db_api.dart';
import 'package:movie_app_view_layer/network/responses/check_out_response.dart';
import 'package:movie_app_view_layer/network/requests/check_out_request.dart';
import 'package:movie_app_view_layer/network/responses/get_credits_by_movie_response.dart';
import 'package:movie_app_view_layer/network/responses/sign_in_with_phone_response.dart';
import 'package:movie_app_view_layer/network/responses/get_otp_response.dart';
import 'package:movie_app_view_layer/network/the_movie_api.dart';

import '../../data/vos/check_out_vo.dart';
import '../../data/vos/movie_vo.dart';

class RetrofitMovieDataAgentImpl extends MovieDataAgent {
  late TheMovieApi api;
  late MovieDbApi movieApi;

  ///[singleton_pattern] implement retrofit data agent impl singleton for one time copy
  RetrofitMovieDataAgentImpl._() {
    final dio = Dio();

    dio.interceptors.add(
      CustomLogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
      ),
    );
    api = TheMovieApi(dio);
    movieApi = MovieDbApi(dio);
  }

  static final RetrofitMovieDataAgentImpl _singleton =
      RetrofitMovieDataAgentImpl._();

  factory RetrofitMovieDataAgentImpl() => _singleton;

  @override
  Future<List<MovieVO>?> getNowPlayingMovie(String page) {
    return movieApi
        .getNowPlayingMovie(API_KEY, LANGUAGE_EN_US, page)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<MovieVO>?> getUpCommingMovie(String page) {
    return movieApi
        .getUpCommingMovie(API_KEY, LANGUAGE_EN_US, page)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<MovieVO?> getMovieDetail(int movieId) {
    return movieApi.getMovieDetail(movieId, API_KEY, LANGUAGE_EN_US);
  }

  @override
  Future<GetCreditsByMovieResponse> getCreditsByMovie(int movieId) {
    return movieApi.getCreditsByMovieResponse(movieId, API_KEY, LANGUAGE_EN_US);
  }

  @override
  Future<List<CityVO>?> getCity() {
    return api.getCity().asStream().map((response) => response.data).first;
  }

  @override
  Future<GetOtpResponse> getOtp(String phone) {
    return api.getOtp(phone);
  }

  @override
  Future<GetOtpResponse> setCity(String token, String cityId) {
    return api.setCity(token, cityId);
  }

  @override
  Future<SignInWithPhoneResponse> singInWithPhone(String phone, String otp) {
    return api.signInWithPhone(phone, otp);
  }

  @override
  Future<List<BannerVO>?> getBanner() {
    return api.getBanners().asStream().map((response) => response.data).first;
  }

  @override
  Future<List<CinemaVO>?> getCinema(String time) {
    return api
        .getCinema(time)
        .asStream()
        .map((response) => response.data)
        .first;
  }

  @override
  Future<List<ConfigVO>?> getConfig() {
    return api.getConfig().asStream().map((response) => response.data).first;
  }

  @override
  Future<List<SnackVO>?> getSnack(String token, int categoryId) {
    return api
        .getSnack(token, categoryId)
        .asStream()
        .map((response) => response.data)
        .first;
  }

  @override
  Future<List<SnackCategoryVO>?> getSnackCategory(String token) {
    return api
        .getSnackCategory(token)
        .asStream()
        .map((response) => response.data)
        .first;
  }

  @override
  Future<List<PaymentVO>?> getPaymentType(String token) {
    return api
        .getPaymentType(token)
        .asStream()
        .map((response) => response.data)
        .first;
  }

  @override
  Future<List<CinemaVO>?> getCinemaTimeSlot(String token, String date) {
    return api
        .getCinemaAndTimeSlot(token, date)
        .asStream()
        .map((response) => response.data)
        .first;
  }

  @override
  Future<CheckOutResponse> checkOut(
      String token, CheckOutRequest checkOutRequest) {
    return api.checkOut(token, checkOutRequest);
  }
}
