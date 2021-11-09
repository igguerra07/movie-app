import 'package:flutter_movie_app/app/models/get_trending_response.dart';
import 'package:flutter_movie_app/app/network/api_service.dart';

abstract class MovieRemoteDataSource {
  Future<GetTrendingResponse> getTrending();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiService _apiService; //endoipts

  MovieRemoteDataSourceImpl(this._apiService);

  @override
  Future<GetTrendingResponse> getTrending() => _apiService.getTrending();
}