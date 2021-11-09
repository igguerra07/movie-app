import 'dart:convert';

import 'package:flutter_movie_app/app/core/constants/api_constants.dart';
import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';
import 'package:flutter_movie_app/app/core/network/api_client.dart';

class ApiService {
  final ApiClient _apiClient;

  ApiService(this._apiClient);

  Future<GetTrendingResponse> getTrending() async {
    final response = await _apiClient.get(path: ApiConstants.getTrending);
    return GetTrendingResponse.fromJson(json.decode(response));
  }

  Future<dynamic> getPopular() async {
    final response = _apiClient.get(path: ApiConstants.getPopular);
    return response;
  }

  Future<dynamic> getComingSoon() async {
    final response = _apiClient.get(path: ApiConstants.getComingSoon);
    return response;
  }

  Future<dynamic> getPlayingNow() async {
    final response = _apiClient.get(path: ApiConstants.getPlayingNow);
    return response;
  }
}