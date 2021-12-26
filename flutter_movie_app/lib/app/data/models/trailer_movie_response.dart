import 'package:flutter_movie_app/app/data/models/video_model.dart';

class TrailerMovieResponse {
  final int id;
  final List<VideoModel> videos;

  TrailerMovieResponse({required this.id, required this.videos});

  TrailerMovieResponse.fromJson(Map<String, dynamic> json)
   : id = json["id"],
     videos = (json['results'] as List<dynamic>)
      .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
      .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'results': videos.map((v) => v.toJson()).toList(),
      };
}


