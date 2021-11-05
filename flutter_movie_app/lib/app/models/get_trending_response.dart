import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/app/models/movie_model.dart';

class GetTrendingResponse extends Equatable {
  final List<MovieModel> movies;

  const GetTrendingResponse(this.movies);

  factory GetTrendingResponse.fromJson(Map<String, dynamic> json) {
    List<MovieModel> movies = [];
    if (json['results'] != null) {
      json['results'].forEach((v) => movies.add(MovieModel.fromJson(v)));
    }
    return GetTrendingResponse(movies);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['results'] = movies.map((v) => v.toJson()).toList();
    return data;
  }

  @override
  List<Object?> get props => [movies];
}