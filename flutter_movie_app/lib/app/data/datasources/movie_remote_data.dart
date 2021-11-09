import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';

abstract class MovieRemoteDataSource {
  Future<GetTrendingResponse> getTrending();
}

