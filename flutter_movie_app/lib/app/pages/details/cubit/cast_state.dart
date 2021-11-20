import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/app/data/entities/app_error.dart';
import 'package:flutter_movie_app/app/data/entities/cast_entity.dart';

abstract class CastState extends Equatable {}

class CastInitialState extends CastState {
  @override
  List<Object?> get props => [];
}

class CastLoadingState extends CastState {
  @override
  List<Object?> get props => [];
}

class CastSuccessState extends CastState {
  final List<CastEntity> movieCast;

  CastSuccessState({ required this.movieCast });

  @override
  List<Object?> get props => [movieCast];
}

class CastFailureState extends CastState {
  final AppError error;

  CastFailureState({ required this.error });

  @override
  List<Object?> get props => [error];
}
