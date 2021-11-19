import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/core/di/get_it.dart';
import 'package:flutter_movie_app/app/core/widgets/empty_state_widget.dart';
import 'package:flutter_movie_app/app/core/widgets/loading_widget.dart';
import 'package:flutter_movie_app/app/data/entities/details_params.dart';
import 'package:flutter_movie_app/app/data/entities/movie_detail_entity.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/details_cubit.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/details_state.dart';
import 'package:flutter_movie_app/app/pages/details/widgets/movie_backdrop_widget.dart';
import 'package:flutter_movie_app/app/pages/details/widgets/movie_bar_widget.dart';
import 'package:flutter_movie_app/app/pages/details/widgets/movie_info_widget.dart';

class DetailsScreen extends StatelessWidget {
  final DetailsParams params;
  final DetailsCubit _detailsCubit = getIt();

  int get _movieId => params.movieId;

  DetailsScreen({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DetailsCubit, DetailsState>(
          bloc: _detailsCubit..getMovieDetails(_movieId),
          builder: (context, state) {
            if(state is DetailsLoadingState) {
              return const LoadingWidget();
            }
            if(state is DetailsSuccessState) {
              final movie = state.movieDetails;
              return Column(
                children: [
                  Stack(
                    children: [
                      MovieBackdropWidget(
                          posterPath: movie.backdropPath ?? "",
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: 56,
                        child: MovieAppBarWidget(
                          onClickBackButton: () => _onClickBackButton(context),
                          onClickFavButton: () => _onClickFavButton(movie),
                        )
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: MovieInfoWidget(
                          title: movie.title,
                          subtitle: movie.releaseDateParsed ?? "",
                          average: movie.voteAverage,
                        )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      movie.overview ?? ""
                    ),
                  )
                ],
              );
            }
            if(state is DetailsFailureState) {
              return EmptyStateWidget(
                type: state.error.type,
                message: state.error.message,
              );
            }
            return const SizedBox.shrink();
          },
        ),
      )
    );
  }


  void _onClickBackButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onClickFavButton(MovieDetailEntity movie) {
    debugPrint("Movie ID => ${movie.id}");
  }
}
