import 'package:dio/dio.dart';
import 'package:movie_app_view_layer/network/api_constants.dart';
import 'package:movie_app_view_layer/network/requests/check_out_request.dart';
import 'package:movie_app_view_layer/network/responses/check_out_response.dart';
import 'package:movie_app_view_layer/network/responses/city_list_response.dart';
import 'package:movie_app_view_layer/network/responses/get_banner_response.dart';
import 'package:movie_app_view_layer/network/responses/get_cinema_response.dart';
import 'package:movie_app_view_layer/network/responses/get_cinema_time_slot_response.dart';
import 'package:movie_app_view_layer/network/responses/get_config_response.dart';
import 'package:movie_app_view_layer/network/responses/get_otp_response.dart';
import 'package:movie_app_view_layer/network/responses/get_payment_response.dart';
import 'package:movie_app_view_layer/network/responses/sign_in_with_phone_response.dart';
import 'package:movie_app_view_layer/network/responses/snack_category_list_response.dart';
import 'package:movie_app_view_layer/network/responses/snack_list_response.dart';
import 'package:retrofit/http.dart';

part 'the_movie_api.g.dart';

@RestApi(baseUrl: PADC_MOVIE_BASE_URL_V2)
abstract class TheMovieApi {
  factory TheMovieApi(Dio dio) = _TheMovieApi;

  @POST(ENDPOINT_GET_OTP)
  Future<GetOtpResponse> getOtp(
    @Field(PARAM_PHONE) String phone,
  );

  @POST(ENDPOINT_SIGN_IN_WITH_PHONE)
  Future<SignInWithPhoneResponse> signInWithPhone(
    @Field(PARAM_PHONE) String phone,
    @Field(PARAM_OTP) String otp,
  );

  @GET(ENDPOINT_GET_CITY)
  Future<CityListResponse> getCity();

  @POST(ENDPOINT_SET_CITY)
  Future<GetOtpResponse> setCity(
    @Header(PARAM_AUTHORIZATION) String token,
    @Field(PARAM_CITY_ID) String cityId,
  );

  @GET(ENDPOINT_GET_BANNERS)
  Future<GetBannerResponse> getBanners();

  @GET(ENDPOINT_GET_CONFIG)
  Future<GetConfigResponse> getConfig();

  @GET(ENDPOINT_GET_CINEMA)
  Future<GetCinemaResponse> getCinema(
    @Query(PARAM_LATEST_TIME) String time,
  );
  @GET(ENDPOINT_GET_CINEMA_SHOW_TIME_BY_DATE)
  Future<GetCinemaTimeSlotResponse> getCinemaAndTimeSlot(
    @Header(PARAM_AUTHORIZATION) String token,
    @Query(PARAM_DATE) String date,
  );

  @GET(ENDPOINT_GET_SNACK_CATEGORY)
  Future<SnackCategoryListResponse> getSnackCategory(
    @Header(PARAM_AUTHORIZATION) String token,
  );

  @GET(ENDPOINT_GET_SNACKS)
  Future<SnackListResponse> getSnack(
    @Header(PARAM_AUTHORIZATION) String token,
    @Query(PARAM_CATEGORY_ID) int categoryId,
  );

  @GET(ENDPOINT_GET_PAYMENT_TYPE)
  Future<GetPaymentResponse> getPaymentType(
    @Header(PARAM_AUTHORIZATION) String token,
  );

  @POST(ENDPOINT_CHECKOUT)
  Future<CheckOutResponse> checkOut(
    @Header(PARAM_AUTHORIZATION) String token,
    @Body() CheckOutRequest checkOutRequest,
  );
}
