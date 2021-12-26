import 'package:flutter_movie_app/app/core/network/api_service.dart';
import 'package:flutter_movie_app/app/data/models/cast_movie_response.dart';
import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';
import 'package:flutter_movie_app/app/data/datasources/movie_remote_data.dart';
import 'package:flutter_movie_app/app/data/models/movie_details_model.dart';
import 'package:flutter_movie_app/app/data/models/trailer_movie_response.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiService _apiService;

  MovieRemoteDataSourceImpl(this._apiService);

  @override
  Future<GetTrendingResponse> getTrending() => _apiService.getTrending();

  @override
  Future<MovieDetailModel> getMovieDetails(int movieId) =>
      _apiService.getMovieDetails(movieId);

  @override
  Future<CastMovieResponse> getMovieCast(int movieId) =>
      _apiService.getCast(movieId);

  @override
  Future<TrailerMovieResponse> getMovieTrailers(int movieId) =>
      _apiService.getVideos(movieId);
}