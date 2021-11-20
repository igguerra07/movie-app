import 'package:flutter_movie_app/app/data/models/cast_model.dart';
import 'package:flutter_movie_app/app/data/models/crew_model.dart';

class CastMovieResponse {
  final int id;
  late final List<CastModel> cast;
  late final List<CrewModel> crew;

  CastMovieResponse({
    required this.id,
    required this.cast,
    required this.crew,
  });

  factory CastMovieResponse.fromJson(Map<String, dynamic> json) {
    final List<CastModel> cast = [];
    final List<CrewModel> crew = [];

    final castRes = json['cast'];
    final crewRes = json['crew'];

    if (castRes != null) {
      for (Map<String, dynamic> model in castRes) {
        final castModel = CastModel.fromJson(model);
        if (_isValidCast(castModel)) cast.add(CastModel.fromJson(model));
      }
    }

    if (crewRes != null) {
      for (Map<String, dynamic> model in crewRes) {
        final crewModel = CrewModel.fromJson(model);
        if (_isValidCrew(crewModel)) crew.add(CrewModel.fromJson(model));
      }
    }

    return CastMovieResponse(
      id: json['id'],
      cast: cast,
      crew: crew,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "cast": cast.map((m) => m.toJson()).toList(),
    "crew": crew.map((m) => m.toJson()).toList(),
  };

}

  bool _isValidCast(CastModel castModel) {
    return
      castModel.name.isNotEmpty &&
      castModel.creditId.isNotEmpty &&
      castModel.character.isNotEmpty &&
      castModel.profilePath.isNotEmpty;
  }

  bool _isValidCrew(CrewModel crewModel) {
    return
      crewModel.name.isNotEmpty &&
      crewModel.creditId.isNotEmpty &&
      crewModel.profilePath.isNotEmpty &&
      crewModel.department.isNotEmpty;
  }

