import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/vos/banner_vo.dart';
import 'package:movie_app_view_layer/data/vos/check_out_vo.dart';
import 'package:movie_app_view_layer/data/vos/cinema_and_time_slot_vo.dart';
import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/data/vos/payment_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_category_vo.dart';
import 'package:movie_app_view_layer/network/dataagents/movie_data_agent.dart';
import 'package:movie_app_view_layer/network/dataagents/retrofit_movie_data_agent_impl.dart';
import 'package:movie_app_view_layer/network/requests/check_out_request.dart';
import 'package:movie_app_view_layer/network/responses/check_out_response.dart';
import 'package:movie_app_view_layer/network/responses/sign_in_with_phone_response.dart';
import 'package:movie_app_view_layer/network/responses/get_otp_response.dart';

class MovieModelImpl extends MovieModel {
  late MovieDataAgent mDataAgent;

  MovieModelImpl._() {
    mDataAgent = RetrofitMovieDataAgentImpl();
  }

  static final MovieModelImpl _singleton = MovieModelImpl._();

  factory MovieModelImpl() => _singleton;

  String? _token;
  List<ConfigVO>? _configs;

  @override
  List<ConfigVO>? get configs => _configs;

  @override
  Future<List<MovieVO>?> getNowPlayingMovie(String page) {
    return mDataAgent.getNowPlayingMovie(page);
  }

  @override
  Future<List<MovieVO>?> getUpCommingMovie(String page) {
    return mDataAgent.getUpCommingMovie(page);
  }

  @override
  Future<MovieVO?> getMovieDetail(String movieId) {
    return mDataAgent.getMovieDetail(movieId);
  }

  @override
  Future<List<CreditVO>?> getCreditsByMovie(String movieId) {
    return mDataAgent.getCreditsByMovie(movieId);
  }

  @override
  Future<List<CityVO>?> getCity() {
    return mDataAgent.getCity();
  }

  @override
  Future<GetOtpResponse> getOtp(String phone) {
    return mDataAgent.getOtp(phone);
  }

  @override
  Future<GetOtpResponse> setCity(String cityId) {
    String bearerToken = 'Bearer $_token';
    return mDataAgent.setCity(bearerToken, cityId);
  }

  @override
  Future<SignInWithPhoneResponse> signInWithPhone(String phone, String otp) {
    final response = mDataAgent.singInWithPhone(phone, otp).then((value) {
      _token = value.token ?? '';

      return value;
    });

    return response;
  }

  @override
  Future<List<BannerVO>?> getBanner() {
    return mDataAgent.getBanner();
  }

  @override
  Future<List<CinemaVO>?> getCinema(String time) {
    return mDataAgent.getCinema(time);
  }

  @override
  Future<List<ConfigVO>?> getConfig() {
    final response = mDataAgent.getConfig().then((response) {
      _configs = response;
      return response;
    });

    return response;
  }

  @override
  Future<List<SnackVO>?> getSnack(String categoryId) {
    String bearerToken = 'Bearer $_token';
    return mDataAgent.getSnack(bearerToken, categoryId);
  }

  @override
  Future<List<SnackCategoryVO>?> getSnackCategory() {
    String bearerToken = 'Bearer $_token';
    return mDataAgent.getSnackCategory(bearerToken);
  }

  @override
  Future<List<PaymentVO>?> getPaymentType() {
    String bearerToken = 'Bearer $_token';
    return mDataAgent.getPaymentType(bearerToken);
  }

  @override
  Future<List<CinemaAndTimeSlotVO>?> getCinemaTimeSlot(String date) {
    String bearerToken = 'Bearer $_token';
    return mDataAgent.getCinemaTimeSlot(bearerToken, date);
  }

  @override
  Future<CheckOutResponse> checkOut(CheckOutRequest checkOutRequest) {
    String bearerToken = 'Bearer $_token';
    return mDataAgent.checkOut(bearerToken, checkOutRequest);
  }
}
