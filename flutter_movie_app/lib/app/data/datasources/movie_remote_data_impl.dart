import 'package:flutter_movie_app/app/core/network/api_service.dart';
import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';
import 'package:flutter_movie_app/app/data/datasources/movie_remote_data.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiService _apiService;

  MovieRemoteDataSourceImpl(this._apiService);

  @override
  Future<GetTrendingResponse> getTrending() => _apiService.getTrending();
}