import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/data/entities/movie_entity.dart';
import 'package:flutter_movie_app/app/pages/home/widgets/movie_item.dart';

class MovieListWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final Function(int movieId) onClickMovie;

  const MovieListWidget({
    Key? key,
    required this.movies,
    required this.onClickMovie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      itemCount: movies.length,
      itemBuilder: (_, index) => MovieItemWidget(
        movie: movies[index],
        onClickMovie: () => onClickMovie(movies[index].id),
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
