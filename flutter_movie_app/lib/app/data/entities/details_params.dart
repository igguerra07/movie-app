import 'package:equatable/equatable.dart';

class DetailsParams extends Equatable {
  final int movieId;

  const DetailsParams({ required this.movieId });

  @override
  List<Object?> get props => [movieId];
}