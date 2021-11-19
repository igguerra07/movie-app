import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/app/data/entities/app_error.dart';
import 'package:flutter_movie_app/app/data/entities/movie_detail_entity.dart';

abstract class DetailsState extends Equatable {}

class DetailsInitialState extends DetailsState {
  @override
  List<Object?> get props => [];
}

class DetailsLoadingState extends DetailsState {
  @override
  List<Object?> get props => [];
}

class DetailsSuccessState extends DetailsState {
  final MovieDetailEntity movieDetails;

  DetailsSuccessState({ required this.movieDetails });

  @override
  List<Object?> get props => [movieDetails];
}

class DetailsFailureState extends DetailsState {
  final AppError error;

  DetailsFailureState({ required this.error });

  @override
  List<Object?> get props => [error];
}
