import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/data/entities/app_error.dart';
import 'package:flutter_movie_app/app/data/models/trailer_movie_response.dart';
import 'package:flutter_movie_app/app/data/repository/movie_repository.dart';
import 'package:flutter_movie_app/app/pages/trailers/cubit/trailer_state.dart';

class TrailersCubit extends Cubit<TrailersState> {
  final MovieRepository _movieRepository;

  TrailersCubit(this._movieRepository) : super(TrailerInitialState());

  Future<void> getMovieTrailers({required int movieId}) async {
    emit(TrailerLoadingState());

    final eitherResponse = await _movieRepository.getMovieTrailers(movieId);

    eitherResponse.fold(
      (error) => _onFailure(error), 
      (response) => _onSuccess(response),
    );
  }

  void _onSuccess(TrailerMovieResponse response) {
    emit(TrailerSuccessState(trailers: response.videos));
  }

  void _onFailure(AppError error) {
    emit(TrailerFailureState(error: error));
  }
}
