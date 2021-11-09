import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/core/di/get_it.dart';
import 'package:flutter_movie_app/app/core/widgets/empty_state_widget.dart';
import 'package:flutter_movie_app/app/core/widgets/loading_widget.dart';
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
      appBar: const HomeAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit..getTrending(),
        builder: (context, state) {
          if(state is HomeLoadingState) {
            return const LoadingWidget();
          }
          if(state is HomeSuccessState) {
            return MovieListWidget(
              movies: state.movies,
              onClickMovie: (movieId) => _navToMovieDetails(context, movieId),
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
    );
  }

  void _navToMovieDetails(BuildContext context, int movieId) {
    debugPrint(movieId.toString());
    //Navigator.of(context).pushNamed(RoutesConstants.details);
  }
}