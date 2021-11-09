import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/pages/home/cubit/home_state.dart';
import 'package:flutter_movie_app/app/data/repository/movie_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final MovieRepository _movieRepository;

  HomeCubit(this._movieRepository) : super(HomeInitialState());

  Future getTrending() async {
    emit(HomeLoadingState());

    final eitherResponse = await _movieRepository.getTrending();

    eitherResponse.fold(
          (failure) => emit(HomeFailureState(error: failure)),
          (success) => emit(HomeSuccessState(movies: success.movies)),
    );
  }
}