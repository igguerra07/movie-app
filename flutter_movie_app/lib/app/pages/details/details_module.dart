import 'package:flutter_movie_app/app/core/di/get_it.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/cast_cubit.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/details_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DetailsModule {
  @injectable
  CastCubit get castCubit => CastCubit(repository: getIt());

  @injectable
  DetailsCubit get detailsCubit => DetailsCubit(repository: getIt());
}