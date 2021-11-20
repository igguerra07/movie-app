import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/app/data/entities/app_error.dart';
import 'package:flutter_movie_app/app/data/models/cast_movie_response.dart';
import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';
import 'package:flutter_movie_app/app/data/models/movie_details_model.dart';

abstract class MovieRepository {
  Future<Either<AppError, GetTrendingResponse>> getTrending();
  Future<Either<AppError, MovieDetailModel>> getMovieDetails(int movieId);
  Future<Either<AppError, CastMovieResponse>> getMovieCast(int movieId);
}