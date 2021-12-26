import 'package:flutter_movie_app/app/data/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  final int size;
  final String id;
  final String key;
  final String name;
  final String site;
  final String type;
  final String iso6391;
  final String iso31661;

  const VideoModel({
    this.id = "",
    this.key = "",
    this.name = "",
    this.site = "",
    this.size = -1,
    this.type = "",
    this.iso6391 = "",
    this.iso31661 = "",
  }) : super(
    key: key ,
    type: type ,
    title: name ,
  );

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id : json['id'],
      key : json['key'],
      name : json['name'],
      site : json['site'],
      size : json['size'],
      type : json['type'],
      iso6391 : json['iso_639_1'],
      iso31661 : json['iso_3166_1'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'key': key,
    'name': name,
    'site': site,
    'size': size,
    'type': type,
    'iso_639_1': iso6391,
    'iso_3166_1': iso31661,
  };
}
