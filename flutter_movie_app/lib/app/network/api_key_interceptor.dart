import 'package:dio/dio.dart';
import 'package:flutter_movie_app/app/constants/api_constants.dart';

class ApiKeyInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.putIfAbsent("api_key", () => ApiConstants.apiKey);
    return super.onRequest(options, handler);
  }
}