import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/core/constants/routes_constants.dart';
import 'package:flutter_movie_app/app/core/di/get_it.dart';
import 'package:flutter_movie_app/app/core/widgets/empty_state_widget.dart';
import 'package:flutter_movie_app/app/core/widgets/loading_widget.dart';
import 'package:flutter_movie_app/app/data/entities/details_params.dart';
import 'package:flutter_movie_app/app/pages/home/cubit/home_cubit.dart';
import 'package:flutter_movie_app/app/pages/home/cubit/home_state.dart';
import 'package:flutter_movie_app/app/pages/home/widgets/home_app_bar.dart';
import 'package:flutter_movie_app/app/pages/home/widgets/movie_list.dart';

class HomeScreen extends StatelessWidget {
  final HomeCubit _homeCubit = getIt();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HomeAppBar(),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                bloc: _homeCubit..getTrending(),
                builder: (context, state) {
                  if(state is HomeLoadingState) {
                    return const LoadingWidget();
                  }
                  if(state is HomeSuccessState) {
                    return MovieListWidget(
                      movies: state.movies,
                      onClickMovie: (movieId) =>
                          _navToMovieDetails(context, movieId),
                    );
                  }
                  if(state is HomeFailureState) {
                    return EmptyStateWidget(
                      type: state.error.type,
                      message: state.error.message,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navToMovieDetails(BuildContext context, int movieId) {
    Navigator.of(context).pushNamed(
      RoutesConstants.details,
      arguments: DetailsParams(movieId: movieId),
    );
  }
}