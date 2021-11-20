import 'dart:convert';

import 'package:flutter_movie_app/app/core/constants/api_constants.dart';
import 'package:flutter_movie_app/app/core/network/api_client.dart';
import 'package:flutter_movie_app/app/data/models/cast_movie_response.dart';
import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';
import 'package:flutter_movie_app/app/data/models/movie_details_model.dart';

class ApiService {
  final ApiClient _apiClient;

  ApiService(this._apiClient);

  Future<GetTrendingResponse> getTrending() async {
    final response = await _apiClient.get(path: ApiConstants.getTrending);
    return GetTrendingResponse.fromJson(json.decode(response));
  }

  Future<MovieDetailModel> getMovieDetails(int movieId) async {
    final path = "${ApiConstants.geDetails}/$movieId";
    final response = await _apiClient.get(path:path);
    return MovieDetailModel.fromJson(json.decode(response));
  }

  Future<CastMovieResponse> getCast(int movieId) async {
    final path = ApiConstants.getCast.replaceFirst(":id", "$movieId");
    final response = await _apiClient.get(path: path);
    return CastMovieResponse.fromJson(json.decode(response));
  }
}