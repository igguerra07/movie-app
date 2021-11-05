class ApiConstants {
  ApiConstants._();

  static const String apiKey = "ENTER_YOUR_API_KEY";

  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String baseImgUrl = "https://image.tmdb.org/t/p/w500";

  static const String getPopular    = "/";
  static const String getTrending   = "/trending/movie/day";
  static const String getComingSoon = "/details";
  static const String getPlayingNow = "/details";
}