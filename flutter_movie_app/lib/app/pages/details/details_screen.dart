import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/core/constants/routes_constants.dart';
import 'package:flutter_movie_app/app/core/di/get_it.dart';
import 'package:flutter_movie_app/app/core/widgets/empty_state_widget.dart';
import 'package:flutter_movie_app/app/core/widgets/loading_widget.dart';
import 'package:flutter_movie_app/app/data/entities/details_params.dart';
import 'package:flutter_movie_app/app/data/entities/movie_detail_entity.dart';
import 'package:flutter_movie_app/app/data/entities/trailers_params.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/cast_cubit.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/details_cubit.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/details_state.dart';
import 'package:flutter_movie_app/app/pages/details/widgets/movie_backdrop_widget.dart';
import 'package:flutter_movie_app/app/pages/details/widgets/movie_bar_widget.dart';
import 'package:flutter_movie_app/app/pages/details/widgets/movie_cast_widget.dart';
import 'package:flutter_movie_app/app/pages/details/widgets/movie_info_widget.dart';

class DetailsScreen extends StatelessWidget {
  final DetailsParams params;
  final CastCubit _castCubit = getIt();
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
      child: LayoutBuilder(
        builder: (builder, constraints) => SingleChildScrollView(
            child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: BlocBuilder<DetailsCubit, DetailsState>(
              bloc: _detailsCubit..getMovieDetails(_movieId),
              builder: (context, state) {
                if (state is DetailsLoadingState) {
                  return const LoadingWidget();
                }
                if (state is DetailsSuccessState) {
                  final movie = state.movieDetails;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                onClickBackButton: () =>
                                    _onClickBackButton(context),
                                onClickFavButton: () =>
                                    _onClickFavButton(movie),
                              )),
                          Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: MovieInfoWidget(
                                title: movie.title,
                                subtitle: movie.releaseDateParsed ?? "",
                                average: movie.voteAverage,
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(movie.overview ?? ""),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          "Cast",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      MovieCastWidget(
                        movieId: _movieId,
                        castCubit: _castCubit,
                      ),
                      Expanded(child: Container()),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: ElevatedButton(
                          child: const Text(
                            "Trailers",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () => _onClickTrailerButton(context, _movieId),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: Colors.grey.shade300,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                if (state is DetailsFailureState) {
                  return EmptyStateWidget(
                    type: state.error.type,
                    message: state.error.message,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        )),
      ),
    ));
  }

  void _onClickTrailerButton(BuildContext context, int movieId) {
    Navigator.of(context).pushNamed(
      RoutesConstants.trailer, 
      arguments: TrailersParams(movieId: movieId),
    );
  }

  void _onClickBackButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onClickFavButton(MovieDetailEntity movie) {
    debugPrint("Movie ID => ${movie.id}");
  }
}
