import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/app/data/entities/app_error.dart';
import 'package:flutter_movie_app/app/data/entities/movie_entity.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  final bool isRefreshing;

  HomeLoadingState({ this.isRefreshing = false });

  @override
  List<Object?> get props => [isRefreshing];
}

class HomeSuccessState extends HomeState {
  final List<MovieEntity> movies;

  HomeSuccessState({ required this.movies });

  @override
  List<Object?> get props => [movies];
}

class HomeFailureState extends HomeState {
  final AppError error;

  HomeFailureState({ required this.error });

  @override
  List<Object?> get props => [error];
}
