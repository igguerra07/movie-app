import 'package:flutter_movie_app/app/data/entities/cast_entity.dart';

class CastModel extends CastEntity {
  final int? id;
  final int? order;
  final int? castId;
  final int? gender;
  final String name;
  final String creditId;
  final String character;
  final String profilePath;

  const CastModel({
    this.id,
    this.order,
    this.castId,
    this.gender,
    required this.name,
    required this.creditId,
    required this.character,
    required this.profilePath,
  }) : super(
    name: name,
    creditId: creditId,
    character: character,
    profilePath: profilePath,
  );

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
    id: json['id'],
    name: json['name'] ?? '',
    order: json['order'],
    castId: json['cast_id'],
    gender: json['gender'],
    character: json['character'] ?? '',
    creditId: json['credit_id'] ?? '',
    profilePath: json['profile_path'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "order": order,
    "gender": gender,
    "cast_id": castId,
    "credit_id": creditId,
    "character": character,
    "profile_path": profilePath,
  };
}