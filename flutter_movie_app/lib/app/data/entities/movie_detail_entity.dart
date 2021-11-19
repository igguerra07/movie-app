import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String title;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  final String? backdropPath;
  final String posterPath;

  String? get releaseDateParsed => releaseDate != null
      ? DateFormat("dd/MM/yyyy").format(DateTime.parse(releaseDate!))
      : null;

  const MovieDetailEntity({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.backdropPath,
    required this.posterPath,
  });

  @override
  List<Object> get props => [id];
}