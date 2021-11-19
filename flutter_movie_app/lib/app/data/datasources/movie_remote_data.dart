import 'package:flutter_movie_app/app/data/models/get_trending_response.dart';
import 'package:flutter_movie_app/app/data/models/movie_details_model.dart';

abstract class MovieRemoteDataSource {
  Future<GetTrendingResponse> getTrending();
  Future<MovieDetailModel> getMovieDetails(int movieId);
}

