import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/app/models/movie_model.dart';

abstract class HomeState extends Equatable {}

class HomeInitialState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeSuccessState extends HomeState {
  final List<MovieModel> movies;

  HomeSuccessState({ required this.movies });

  @override
  List<Object?> get props => [movies];
}

class HomeFailureState extends HomeState {
  @override
  List<Object?> get props => [];
}
