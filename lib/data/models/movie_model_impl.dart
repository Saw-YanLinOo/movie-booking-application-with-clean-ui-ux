import 'package:flutter/cupertino.dart';
import 'package:movie_app_view_layer/data/models/movie_model.dart';
import 'package:movie_app_view_layer/data/vos/banner_vo.dart';
import 'package:movie_app_view_layer/data/vos/cinema_list_vo.dart';
import 'package:movie_app_view_layer/data/vos/cinema_vo.dart';
import 'package:movie_app_view_layer/data/vos/city_vo.dart';
import 'package:movie_app_view_layer/data/vos/config_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_list_vo.dart';
import 'package:movie_app_view_layer/data/vos/credit_vo.dart';
import 'package:movie_app_view_layer/data/vos/movie_vo.dart';
import 'package:movie_app_view_layer/data/vos/payment_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_vo.dart';
import 'package:movie_app_view_layer/data/vos/snack_category_vo.dart';
import 'package:movie_app_view_layer/data/vos/time_slot_vo.dart';
import 'package:movie_app_view_layer/data/vos/user_vo.dart';
import 'package:movie_app_view_layer/network/dataagents/movie_data_agent.dart';
import 'package:movie_app_view_layer/network/dataagents/retrofit_movie_data_agent_impl.dart';
import 'package:movie_app_view_layer/network/requests/check_out_request.dart';
import 'package:movie_app_view_layer/network/responses/check_out_response.dart';
import 'package:movie_app_view_layer/network/responses/sign_in_with_phone_response.dart';
import 'package:movie_app_view_layer/network/responses/get_otp_response.dart';
import 'package:movie_app_view_layer/persistence/daos/banner_dao.dart';
import 'package:movie_app_view_layer/persistence/daos/cinema_time_slot_dao.dart';
import 'package:movie_app_view_layer/persistence/daos/city_dao.dart';
import 'package:movie_app_view_layer/persistence/daos/config_dao.dart';
import 'package:movie_app_view_layer/persistence/daos/credit_dao.dart';
import 'package:movie_app_view_layer/persistence/daos/movie_dao.dart';
import 'package:movie_app_view_layer/persistence/daos/payment_dao.dart';
import 'package:movie_app_view_layer/persistence/daos/snack_category_dao.dart';
import 'package:movie_app_view_layer/persistence/daos/snack_dao.dart';
import 'package:movie_app_view_layer/persistence/daos/user_dao.dart';
import 'package:stream_transform/stream_transform.dart';

class MovieModelImpl extends MovieModel {
  late MovieDataAgent mDataAgent;

  MovieModelImpl._() {
    mDataAgent = RetrofitMovieDataAgentImpl();
  }

  static final MovieModelImpl _singleton = MovieModelImpl._();

  factory MovieModelImpl() => _singleton;

  //String? _token;

  /// Daos
  ConfigDao mConfigDao = ConfigDao();
  UserDao mUserDao = UserDao();
  CityDao mCityDao = CityDao();
  CinemaTimeSlotDao mCinemaTimeSlotDao = CinemaTimeSlotDao();
  BannerDao mBannerDao = BannerDao();
  MovieDao mMovieDao = MovieDao();
  CreditDao mCreditDao = CreditDao();
  SnackCategoryDao mSanckCategoryDao = SnackCategoryDao();
  SnackDao mSanckDao = SnackDao();
  PaymetnDao mPaymentDao = PaymetnDao();

  // Network
  @override
  void getNowPlayingMovie(String page) {
    mDataAgent.getNowPlayingMovie(page).then((movies) {
      List<MovieVO> nowPlayingMovie = movies?.map((movie) {
            movie.isNowShowing = true;
            movie.isCommingSoon = false;
            return movie;
          }).toList() ??
          [];

      mMovieDao.saveMovies(nowPlayingMovie);
    });
  }

  @override
  void getUpCommingMovie(String page) {
    mDataAgent.getUpCommingMovie(page).then((movies) {
      List<MovieVO>? upCommingMovie = movies?.map((movie) {
        movie.isNowShowing = false;
        movie.isCommingSoon = true;
        return movie;
      }).toList();

      mMovieDao.saveMovies(upCommingMovie ?? []);
    });
  }

  @override
  void getMovieDetail(int movieId) {
    mDataAgent.getMovieDetail(movieId).then((movie) {
      var mMovie = mMovieDao.getMovieById(movieId);
      movie?.isCommingSoon = mMovie?.isCommingSoon;
      movie?.isNowShowing = mMovie?.isNowShowing;

      mMovieDao.saveSingleMovie(movie ?? MovieVO());
    });
  }

  @override
  void getCreditsByMovie(int movieId) {
    mDataAgent.getCreditsByMovie(movieId).then((response) {
      var creditList = CreditListVO(creditList: response.cost);
      mCreditDao.saveCreditByMovieId(response.id ?? 0, creditList);
    });
  }

  @override
  void getCity() {
    mDataAgent.getCity().then((cities) {
      mCityDao.saveCities(cities ?? []);
    });
  }

  @override
  Future<GetOtpResponse> getOtp(String phone) {
    return mDataAgent.getOtp(phone);
  }

  @override
  Future<GetOtpResponse> setCity(String cityId) {
    String bearerToken = mUserDao.getUserToken();
    return mDataAgent.setCity(bearerToken, cityId);
  }

  @override
  Future<SignInWithPhoneResponse> signInWithPhone(String phone, String otp) {
    final response = mDataAgent.singInWithPhone(phone, otp).then((value) {
      var user = value.userVo;
      user?.token = 'Bearer ${value.token}';
      mUserDao.saveUser(user ?? UserVo());
      return value;
    });

    return response;
  }

  @override
  void getBanner() {
    mDataAgent.getBanner().then((banners) {
      mBannerDao.saveBannerList(banners ?? []);
    });
  }

  @override
  void getCinema(String date) {
    mDataAgent.getCinema(date).then((cinemas) {
      mCinemaTimeSlotDao.saveCinemaAndTimeSlotByDate(
          date, CinemaListVO(cinemaList: cinemas));
    });
  }

  @override
  void getConfig() {
    mDataAgent.getConfig().then((configs) {
      mConfigDao.saveConfig(configs ?? []);
    });
  }

  @override
  void getSnack(int categoryId) {
    String bearerToken = mUserDao.getUserToken();
    mDataAgent.getSnack(bearerToken, categoryId).then((snacks) {
      mSanckDao.saveSnacks(snacks ?? []);
    });
  }

  @override
  void getSnackCategory() {
    String bearerToken = mUserDao.getUserToken();
    mDataAgent.getSnackCategory(bearerToken).then((snackCats) {
      mSanckCategoryDao.saveSnackCategory(snackCats ?? []);
    });
  }

  @override
  void getPaymentType() {
    String bearerToken = mUserDao.getUserToken();
    mDataAgent.getPaymentType(bearerToken).then((payments) {
      mPaymentDao.savePayment(payments ?? []);
    });
  }

  @override
  void getCinemaTimeSlot(String date) async {
    getCinema(date);
    String bearerToken = mUserDao.getUserToken();
    mDataAgent.getCinemaTimeSlot(bearerToken, date).then((timeSlotList) async {
      // get cinema detail list
      List<CinemaVO>? cinemaList = mCinemaTimeSlotDao.getCinemaListByDate(date);

      var cinemaTimeSlotList = await Future.value(
        cinemaList?.map((cinema) {
          timeSlotList?.forEach((timeSlot) {
            if (cinema.id == timeSlot.cinemaId) {
              cinema.timeSlotList = timeSlot.timeSlotList;
            }
          });
          return cinema;
        }).toList(),
      );

      //save cinema time slot
      mCinemaTimeSlotDao.saveCinemaAndTimeSlotByDate(
          date, CinemaListVO(cinemaList: cinemaTimeSlotList));
    });
  }

  @override
  Future<CheckOutResponse> checkOut(CheckOutRequest checkOutRequest) {
    String bearerToken = mUserDao.getUserToken();
    return mDataAgent.checkOut(bearerToken, checkOutRequest);
  }

  // Database
  @override
  Stream<List<MovieVO>?> getNowPlayingMovieFromDatabase() {
    getNowPlayingMovie('1');
    return mMovieDao
        .getMovieEventStream()
        .startWith(mMovieDao.getNowPlayingMoviesStream())
        .map((event) => mMovieDao.getNowPlayingMovies());
  }

  @override
  Stream<List<MovieVO>?> getUpCommingMovieFromDatabase() {
    getUpCommingMovie('1');
    return mMovieDao
        .getMovieEventStream()
        .startWith(mMovieDao.getCommingSoonMoviesStream())
        .map((event) => mMovieDao.getCommingSoonMovies());
  }

  @override
  Stream<List<BannerVO>?> getBannerFromDatabase() {
    getBanner();
    return mBannerDao
        .getBannerEventStream()
        .startWith(mBannerDao.getBannerListStream())
        .map((event) => mBannerDao.getBannerList());
  }

  @override
  Stream<List<CityVO>?> getCityFromDatabase() {
    getCity();
    return mCityDao
        .getCityEventStream()
        .startWith(mCityDao.getCityListStream())
        .map((event) => mCityDao.getCityList());
  }

  @override
  Stream<List<CreditVO>?> getCreditsByMovieIdFromDatabase(int movieId) {
    getCreditsByMovie(movieId);
    return mCreditDao
        .getCreditEventStream()
        .startWith(mCreditDao.getCreditListByMovieIdStream(movieId))
        .map((event) => mCreditDao.getCreditListByMovieId(movieId));
  }

  @override
  Stream<MovieVO?> getMovieDetailFromDatabase(int movieId) {
    getMovieDetail(movieId);
    return mMovieDao
        .getMovieEventStream()
        .startWith(mMovieDao.getMovieByIdStream(movieId))
        .map((event) => mMovieDao.getMovieById(movieId));
  }

  @override
  Stream<UserVo?> getUserFromDatabase() {
    return mUserDao
        .getUserEventStream()
        .startWith(mUserDao.getUserStream())
        .map((event) => mUserDao.getUser());
  }

  @override
  Future<List<ConfigVO>?> getConfigFromDatabase() {
    return Future.value(mConfigDao.getConfig());
  }

  @override
  Stream<List<CinemaVO>?> getCinemaAndTimeSlotByDateFromDatabase(String date) {
    getCinemaTimeSlot(date);
    return mCinemaTimeSlotDao
        .getCinemaEventStream()
        .startWith(mCinemaTimeSlotDao.getCinamListByDateStream(date))
        .map((event) => mCinemaTimeSlotDao.getCinemaListByDate(date));
  }

  @override
  Stream<List<PaymentVO>?> getPaymentTypeFromDatabase() {
    getPaymentType();
    return mPaymentDao
        .getPaymentEventStream()
        .startWith(mPaymentDao.getPaymentListStream())
        .map((event) => mPaymentDao.getPaymentList());
  }

  @override
  Stream<List<SnackCategoryVO>?> getSnackCategoryFromDatabase() {
    getSnackCategory();
    return mSanckCategoryDao
        .getSnackCategoryEventStream()
        .startWith(mSanckCategoryDao.getSnackCategoryListStream())
        .map((event) => mSanckCategoryDao.getSnackCategoryList());
  }

  @override
  Stream<List<SnackVO>?> getSnackByCatIdFromDatabase(int categoryId) {
    getSnack(categoryId);

    return mSanckDao
        .getSnackEventStream()
        .startWith(mSanckDao.getSnackListStream(categoryId))
        .map((event) => mSanckDao.getSnackList(categoryId));
  }
}
