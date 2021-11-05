import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/data/movie_remote_data.dart';
import 'package:flutter_movie_app/app/data/movie_repository.dart';
import 'package:flutter_movie_app/app/di/get_it.dart';
import 'package:flutter_movie_app/app/features/home/cubit/home_cubit.dart';
import 'package:flutter_movie_app/app/network/api_client.dart';
import 'package:flutter_movie_app/app/network/api_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiClient get apiClient => DioClient(getIt<Dio>());

  @lazySingleton
  ApiService get apiService => ApiService(getIt<ApiClient>());

  @lazySingleton
  MovieRemoteDataSource get remoteDataSource =>
      MovieRemoteDataSourceImpl(getIt<ApiService>());

  @lazySingleton
  MovieRepository get repository =>
      MovieRepositoryImpl(getIt<MovieRemoteDataSource>());

  @injectable
  HomeCubit get homeCubit => HomeCubit(getIt<MovieRepository>());
}