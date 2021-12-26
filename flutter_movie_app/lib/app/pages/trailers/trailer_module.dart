import 'package:flutter_movie_app/app/core/di/get_it.dart';
import 'package:flutter_movie_app/app/data/repository/movie_repository.dart';
import 'package:flutter_movie_app/app/pages/trailers/cubit/trailer_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class TrailersModule {
  TrailersCubit get trailersCubit => 
    TrailersCubit(getIt<MovieRepository>());
}
