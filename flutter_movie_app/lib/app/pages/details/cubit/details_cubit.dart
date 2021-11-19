import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/data/repository/movie_repository.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final MovieRepository repository;

  DetailsCubit({ required this.repository }) : super(DetailsInitialState());

  void getMovieDetails(int movieId) async {
    emit(DetailsLoadingState());

    final eitherResponse = await repository.getMovieDetails(movieId);

    eitherResponse.fold(
            (appError) => emit(DetailsFailureState(error: appError)),
            (details) => emit(DetailsSuccessState(movieDetails: details)),
    );
  }
}