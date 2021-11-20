import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/data/repository/movie_repository.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/cast_state.dart';

class CastCubit extends Cubit<CastState> {
  final MovieRepository repository;

  CastCubit({ required this.repository }) : super(CastInitialState());

  void getMovieCast(int movieId) async {
    emit(CastLoadingState());

    final eitherResponse = await repository.getMovieCast(movieId);

    eitherResponse.fold(
          (appError) => emit(CastFailureState(error: appError)),
          (cast) => emit(CastSuccessState(movieCast: cast.cast)),
    );
  }
}