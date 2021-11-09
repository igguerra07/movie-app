import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/constants/api_constants.dart';
import 'package:flutter_movie_app/app/di/get_it.dart';
import 'package:flutter_movie_app/app/features/home/cubit/home_cubit.dart';
import 'package:flutter_movie_app/app/features/home/cubit/home_state.dart';
import 'package:flutter_movie_app/app/models/movie_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeCubit _homeCubit = getIt();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MovieApp"), actions: [
        IconButton(onPressed: () => {}, icon: const Icon(Icons.search_outlined))
      ],),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit..getTrending(),
         builder: (context, state) {
           if(state is HomeLoadingState) {
             return const Center(child: CircularProgressIndicator());
           }
           if(state is HomeSuccessState) {
             return ListView.separated(
               padding: const EdgeInsets.all(8),
               shrinkWrap: true,
               itemCount: state.movies.length,
               itemBuilder: (_, index) =>
                   buildMovieItem(state.movies[index]),
               separatorBuilder: (_, __) => const SizedBox(height: 16),
             );
           }
           if(state is HomeFailureState) {
             return const Center(child: Text("Deu bad"));
           }
           return const SizedBox.shrink();
         },
      )
    );
  }

  /**
   * coisa feio coisosssauro egiste
   */
  buildMovieItem(MovieModel movie) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 80,
              margin: const EdgeInsets.only(right: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                  "${ApiConstants.baseImgUrl}/${movie.posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle( fontWeight: FontWeight.bold),
                  ),
                  Text(
                    movie.overview,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}