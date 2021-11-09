import 'package:dartz/dartz.dart';
import 'package:flutter_movie_app/app/data/entities/app_error.dart';
import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';

abstract class MovieRepository {
  Future<Either<AppError, GetTrendingResponse>> getTrending();
}