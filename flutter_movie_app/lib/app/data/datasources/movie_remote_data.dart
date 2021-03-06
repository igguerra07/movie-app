import 'package:flutter_movie_app/app/data/models/cast_movie_response.dart';
import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';
import 'package:flutter_movie_app/app/data/models/movie_details_model.dart';
import 'package:flutter_movie_app/app/data/models/trailer_movie_response.dart';

abstract class MovieRemoteDataSource {
  Future<GetTrendingResponse> getTrending();
  Future<MovieDetailModel> getMovieDetails(int movieId);
  Future<CastMovieResponse> getMovieCast(int movieId);
  Future<TrailerMovieResponse> getMovieTrailers(int movieId);
}

