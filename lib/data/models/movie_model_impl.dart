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
  CinemaTimeSlotDao mCinemaDao = CinemaTimeSlotDao();
  BannerDao mBannerDao = BannerDao();
  MovieDao mMovieDao = MovieDao();
  CreditDao mCreditDao = CreditDao();
  SnackCategoryDao mSanckCategoryDao = SnackCategoryDao();
  SnackDao mSanckDao = SnackDao();
  PaymetnDao mPaymentDao = PaymetnDao();

  // Network
  @override
  Future<List<MovieVO>?> getNowPlayingMovie(String page) {
    return mDataAgent.getNowPlayingMovie(page).then((movies) {
      List<MovieVO> nowPlayingMovie = movies?.map((movie) {
            movie.isNowShowing = true;
            movie.isCommingSoon = false;
            return movie;
          }).toList() ??
          [];

      debugPrint('now playing movie :::::::: ${nowPlayingMovie}');
      mMovieDao.saveMovies(nowPlayingMovie);
      return movies;
    });
  }

  @override
  Future<List<MovieVO>?> getUpCommingMovie(String page) {
    return mDataAgent.getUpCommingMovie(page).then((movies) {
      List<MovieVO>? upCommingMovie = movies?.map((movie) {
        movie.isNowShowing = false;
        movie.isCommingSoon = true;
        return movie;
      }).toList();

      mMovieDao.saveMovies(upCommingMovie ?? []);
      return movies;
    });
  }

  @override
  Future<MovieVO?> getMovieDetail(String movieId) {
    return mDataAgent.getMovieDetail(movieId).then((movie) {
      mMovieDao.saveSingleMovie(movie ?? MovieVO());
      return movie;
    });
  }

  @override
  Future<List<CreditVO>?> getCreditsByMovie(String movieId) {
    return mDataAgent.getCreditsByMovie(movieId).then((response) {
      var creditList = CreditListVO(creditList: response.cost);
      mCreditDao.saveCredit(response.id ?? 0, creditList);
      return response.cost;
    });
  }

  @override
  Future<List<CityVO>?> getCity() {
    return mDataAgent.getCity().then((cities) {
      mCityDao.saveCities(cities ?? []);
      return cities;
    });
  }

  @override
  Future<GetOtpResponse> getOtp(String phone) {
    return mDataAgent.getOtp(phone);
  }

  @override
  Future<GetOtpResponse> setCity(String cityId) {
    String bearerToken = 'Bearer ${mUserDao.getUser()?.token}';
    return mDataAgent.setCity(bearerToken, cityId);
  }

  @override
  Future<SignInWithPhoneResponse> signInWithPhone(String phone, String otp) {
    final response = mDataAgent.singInWithPhone(phone, otp).then((value) {
      var user = value.userVo;
      user?.token = value.token;
      mUserDao.saveUser(user ?? UserVo());
      return value;
    });

    return response;
  }

  @override
  Future<List<BannerVO>?> getBanner() {
    return mDataAgent.getBanner().then((banners) {
      mBannerDao.saveBanners(banners ?? []);
      return banners;
    });
  }

  @override
  Future<List<CinemaVO>?> getCinema(String date) {
    return mDataAgent.getCinema(date).then((cinemas) {
      mCinemaDao.saveCinemaTimeSlot(date, CinemaListVO(cinemaList: cinemas));
      return cinemas;
    });
  }

  @override
  Future<List<ConfigVO>?> getConfig() {
    final response = mDataAgent.getConfig().then((configs) {
      mConfigDao.saveConfig(configs ?? []);
      return configs;
    });

    return response;
  }

  @override
  Future<List<SnackVO>?> getSnack(String categoryId) {
    String bearerToken = 'Bearer ${mUserDao.getUser()?.token}';
    return mDataAgent.getSnack(bearerToken, categoryId).then((snacks) {
      mSanckDao.saveSnacks(snacks ?? []);

      return snacks;
    });
  }

  @override
  Future<List<SnackCategoryVO>?> getSnackCategory() {
    String bearerToken = 'Bearer ${mUserDao.getUser()?.token}';
    return mDataAgent.getSnackCategory(bearerToken).then((snackCats) {
      mSanckCategoryDao.saveSnackCategory(snackCats ?? []);
      return snackCats;
    });
  }

  @override
  Future<List<PaymentVO>?> getPaymentType() {
    String bearerToken = 'Bearer ${mUserDao.getUser()?.token}';
    return mDataAgent.getPaymentType(bearerToken).then((payments) {
      mPaymentDao.savePayment(payments ?? []);
      return payments;
    });
  }

  @override
  Future<List<CinemaVO>?> getCinemaTimeSlot(String date) async {
    String bearerToken = 'Bearer ${mUserDao.getUser()?.token}';
    return mDataAgent
        .getCinemaTimeSlot(bearerToken, date)
        .then((timeSlotList) async {
      // get cinema detail list
      List<CinemaVO>? cinemaList = await getCinema(date);

      // add cinema detail list with time slot

      // var len = cinemaList?.length ?? 0;
      // for (var i = 0; i < len; i++) {
      //   if (cinemaList?[i].id == timeSlotList?[i].id) {
      //     cinemaList?[i].timeSlotList = timeSlotList?[i].timeSlotList;
      //   }
      // }
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
      mCinemaDao.saveCinemaTimeSlot(
          date, CinemaListVO(cinemaList: cinemaTimeSlotList));
      return cinemaTimeSlotList;
    });
  }

  @override
  Future<CheckOutResponse> checkOut(CheckOutRequest checkOutRequest) {
    String bearerToken = 'Bearer ${mUserDao.getUser()?.token}';
    return mDataAgent.checkOut(bearerToken, checkOutRequest);
  }

  // Database
  @override
  Future<List<MovieVO>?> getUpCommingMovieFromDatabase() {
    return Future.value(
      mMovieDao
          .getAllMovies()
          .where((movie) => movie.isCommingSoon ?? false)
          .toList(),
    );
  }

  @override
  Future<List<BannerVO>?> getBannerFromDatabase() {
    return Future.value(
      mBannerDao.getBanners().toList(),
    );
  }

  @override
  Future<List<CityVO>?> getCityFromDatabase() {
    return Future.value(mCityDao.getCity());
  }

  @override
  Future<List<CreditVO>?> getCreditsByMovieIdFromDatabase(int movieId) {
    return Future.value(
      mCreditDao.getCreditByMovieId(movieId)?.creditList,
    );
  }

  @override
  Future<MovieVO?> getMovieDetailFromDatabase(int movieId) {
    return Future.value(
      mMovieDao.getMovieById(movieId),
    );
  }

  @override
  Future<List<MovieVO>?> getNowPlayingMovieFromDatabase() {
    return Future.value(
      mMovieDao
          .getAllMovies()
          .where((movie) => movie.isNowShowing ?? false)
          .toList(),
    );
  }

  @override
  Future<UserVo?> getUserFromDatabase() {
    return Future.value(mUserDao.getUser());
  }

  @override
  Future<List<ConfigVO>?> getConfigFromDatabase() {
    return Future.value(mConfigDao.getConfig());
  }

  @override
  Future<List<CinemaVO>?> getCinemaAndTimeSlotByDateFromDatabase(String date) {
    var cinemaList = mCinemaDao.getCinemaListByDate(date);
    debugPrint('cinemaList database ::: $cinemaList');
    return Future.value(
      cinemaList?.cinemaList,
    );
  }

  @override
  Future<List<PaymentVO>?> getPaymentTypeFromDatabase() {
    return Future.value(mPaymentDao.getPayment());
  }

  @override
  Future<List<SnackCategoryVO>?> getSnackCategoryFromDatabase() {
    return Future.value(mSanckCategoryDao.getSnackCategory());
  }

  @override
  Future<List<SnackVO>?> getSnackByCatIdFromDatabase(int categoryId) {
    List<SnackVO>? snackList;
    if (categoryId == 0) {
      snackList = mSanckDao.getSnack().toList();
    } else {
      snackList = mSanckDao
          .getSnack()
          .where((snack) => snack.categoryId == categoryId)
          .toList();
    }
    return Future.value(snackList);
  }
}
