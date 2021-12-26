import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/app/data/entities/app_error.dart';
import 'package:flutter_movie_app/app/data/entities/video_entity.dart';

abstract class TrailersState extends Equatable {}

class TrailerInitialState extends TrailersState {
  @override
  List<Object?> get props => [];
}

class TrailerLoadingState extends TrailersState {
  @override
  List<Object?> get props => [];
}

class TrailerSuccessState extends TrailersState {
  final List<VideoEntity> trailers;

  TrailerSuccessState({required this.trailers});

  @override
  List<Object?> get props => [trailers];
}

class TrailerFailureState extends TrailersState {
  final AppError error;

  TrailerFailureState({required this.error});

  @override
  List<Object?> get props => [error];
}
