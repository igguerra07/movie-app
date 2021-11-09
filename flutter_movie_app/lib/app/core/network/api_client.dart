import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_movie_app/app/core/constants/api_constants.dart';
import 'package:flutter_movie_app/app/core/network/api_key_interceptor.dart';

abstract class ApiClient {
  Future get({ required String path, Map<String, dynamic> queryParams });
  Future post({ required String path, dynamic body });
  Future patch(String path);
  Future delete(String path);
}

class DioClient implements ApiClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.interceptors.addAll([
      LogInterceptor(responseBody: true),
      ApiKeyInterceptor(),
    ]);
  }

  @override
  Future get({
    required String path,
    Map<String, dynamic> queryParams = const {},
  }) async {
    final response = await _dio.get(path, queryParameters: queryParams);
    return json.encode(response.data);
  }

  @override
  Future post({ required String path,  dynamic body }) async {
    final response = await _dio.post(path);
    return json.encode(response.data);
  }

  @override
  Future patch(String path) async {
    final response = await _dio.patch(path);
    return json.encode(response.data);
  }

  @override
  Future delete(String path) async{
    final response = await _dio.delete(path);
    return json.encode(response.data);
  }
}