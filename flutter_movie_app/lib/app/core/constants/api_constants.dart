class ApiConstants {
  ApiConstants._();

  static const String apiKey = "894df8957a9ce2cdac0b54ef990479f7";

  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String baseImgUrl = "https://image.tmdb.org/t/p/w500";

  static const String getCast     = "/movie/:id/credits";
  static const String getTrailers = "/movie/:id/videos";
  static const String geDetails   = "/movie";
  static const String getTrending = "/trending/movie/day";
}