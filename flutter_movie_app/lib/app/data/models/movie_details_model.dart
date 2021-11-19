import 'package:flutter_movie_app/app/data/entities/movie_detail_entity.dart';

class MovieDetailModel extends MovieDetailEntity {
  final bool? adult;
  final String? backdropPath;
  final int? budget;
  final String? homepage;
  final int id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String posterPath;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? tagline;
  final String title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  const MovieDetailModel({
    this.adult,
    this.backdropPath,
    this.budget,
    this.homepage,
    required this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    required this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    required this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  }) : super (
    id: id,
    title: title,
    releaseDate: releaseDate ?? "",
    overview: overview ?? "",
    voteAverage: voteAverage ?? 0.0,
    backdropPath: backdropPath ?? "",
    posterPath: posterPath,
  );

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      budget: json['budget'],
      homepage: json['homepage'],
      id: json['id'] ?? -1,
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'] ?? '',
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() => {
    "adult" : adult,
    "backdrop_path" : backdropPath,
    "budget" : budget,
    "homepage" : homepage,
    "id" : id,
    "imdb_id" : imdbId,
    "original_language" : originalLanguage,
    "original_title" : originalTitle,
    "overview" : overview,
    "popularity" : popularity,
    "poster_path" : posterPath,
    "release_date" : releaseDate,
    "revenue" : revenue,
    "runtime" : runtime,
    "status" : status,
    "tagline" : tagline,
    "title" : title,
    "video" : video,
    "vote_average" : voteAverage,
    "vote_count" : voteCount,
  };
}