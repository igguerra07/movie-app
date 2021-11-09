import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num? voteAverage;
  final String? releaseDate;
  final String? overview;

  String? get releaseDateParsed => releaseDate != null
      ? DateFormat("dd/MM/yyyy").format(DateTime.parse(releaseDate!))
      : null;

  const MovieEntity({
    required this.posterPath,
    required this.id,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    this.overview,
  });

  @override
  List<Object> get props => [id, title];
}