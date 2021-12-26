import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_movie_app/app/data/entities/app_error.dart';
import 'package:flutter_movie_app/app/data/models/cast_movie_response.dart';
import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';
import 'package:flutter_movie_app/app/data/datasources/movie_remote_data.dart';
import 'package:flutter_movie_app/app/data/models/movie_details_model.dart';
import 'package:flutter_movie_app/app/data/models/trailer_movie_response.dart';
import 'package:flutter_movie_app/app/data/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource _remoteDataSource;

  MovieRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppError, GetTrendingResponse>> getTrending() async {
    try {
      final response = await _remoteDataSource.getTrending();
      return right(response);
    } on DioError catch (e) {
      return left(AppError(type: e.type, message: e.message));
    } catch (e) {
      return left(AppError(type: DioErrorType.other, message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetails(
      int movieId) async {
    try {
      final response = await _remoteDataSource.getMovieDetails(movieId);
      return right(response);
    } on DioError catch (e) {
      return left(AppError(type: e.type, message: e.message));
    } catch (e) {
      return left(AppError(type: DioErrorType.other, message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, CastMovieResponse>> getMovieCast(int movieId) async {
    try {
      final response = await _remoteDataSource.getMovieCast(movieId);
      return right(response);
    } on DioError catch (e) {
      return left(AppError(type: e.type, message: e.message));
    } catch (e) {
      return left(AppError(type: DioErrorType.other, message: e.toString()));
    }
  }

  @override
  Future<Either<AppError, TrailerMovieResponse>> getMovieTrailers(
      int movieId) async {
    try {
      final response = await _remoteDataSource.getMovieTrailers(movieId);
      return right(response);
    } on DioError catch (e) {
      return left(AppError(type: e.type, message: e.message));
    } catch (e, st) {
      print(st.toString());
      return left(AppError(type: DioErrorType.other, message: e.toString()));
    }
  }
}
