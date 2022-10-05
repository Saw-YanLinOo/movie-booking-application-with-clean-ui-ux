//Base Url
const String MOVIE_DB_BASE_URL = 'https://api.themoviedb.org';
const String PADC_MOVIE_BASE_URL_V2 = 'https://tmba.padc.com.mm';

const String IMAGE_BASE_URL = 'http://image.tmdb.org/t/p/w400';
const String QR_IMAGE_BASE_URL = 'https://tmba.padc.com.mm';
//End Points
// Version :: 2
const String ENDPOINT_SIGN_IN_WITH_PHONE = '/api/v2/check-otp';
const String ENDPOINT_GET_OTP = '/api/v2/get-otp';
const String ENDPOINT_SIGN_IN_WITH_GOOGLE = '/api/v2/sign-in-with-google';
const String ENDPOINT_SET_CITY = '/api/v2/set-city';
const String ENDPOINT_GET_CITY = '/api/v2/cities';
const String ENDPOINT_GET_CONFIG = '/api/v2/configurations';

const String ENDPOINT_GET_BANNERS = '/api/v2/banners';
const String ENDPOINT_GET_NOW_PLAYING_MOVIE = '/3/movie/now_playing';
const String ENDPOINT_GET_UP_COMMING_MOVIE = '/3/movie/upcoming';

const String ENDPOINT_GET_MOVIE_DETAILS =
    '/3/movie/'; // => /api/v1/movies/movie_id
const String ENDPOINT_GET_CREDITS_BY_MOVIE =
    '/3/movie'; // => /movie/616037/credits?api_key=487035a582a1e82376b42010973387a6&language=en-US&page=1
const String ENDPOINT_GET_CINEMA =
    '/api/v2/cinemas'; // => /api/v2/cinemas?latest_time=2022-09-17 00:23:04
const String ENDPOINT_GET_CINEMA_SHOW_TIME_BY_DATE =
    '/api/v2/cinema-day-timeslots'; // => /api/v2/cinemas?latest_time=2022-09-17 00:23:04

const String ENDPOINT_GET_SNACKS = '/api/v2/snacks';
const String ENDPOINT_GET_SNACK_CATEGORY = '/api/v2/snack-categories';
const String ENDPOINT_GET_PAYMENT_TYPE = '/api/v2/payment-types';
const String ENDPOINT_CHECKOUT = '/api/v2/checkout';

// Paramaters
const String PARAM_API_KEY = 'api_key';
const String PARAM_LANGUAGE = 'language';
const String PARAM_PAGE = 'page';
const String PARAM_GENRE_ID = 'with_genres';
const String PARAM_MOVIE_ID = 'movie_id';
const String PARAM_LATEST_TIME = 'lastest_time';
const String PARAM_DATE = 'date';
const String PARAM_MOVIE_STATUS = 'status';
const String PARAM_PHONE = 'phone';
const String PARAM_OTP = 'otp';
const String PARAM_AUTHORIZATION = 'Authorization';
const String PARAM_CITY_ID = 'city_id';
const String PARAM_CATEGORY_ID = 'category_id';

//Constant Values
const String TOKEN_KEY = '13766|0SNVdwk0FRAF2PI20EYgbfDeBaM98gg5awE5v0tX';
const String API_KEY = '487035a582a1e82376b42010973387a6';
const String LANGUAGE_EN_US = 'en-US';
