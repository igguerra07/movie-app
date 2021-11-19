import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/core/constants/api_constants.dart';
import 'package:flutter_movie_app/app/core/widgets/movie_average_widget.dart';
import 'package:flutter_movie_app/app/data/entities/movie_entity.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onClickMovie;

  const MovieItemWidget({
    Key? key,
    required this.movie,
    required this.onClickMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => onClickMovie(),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 80,
                  margin: const EdgeInsets.only(right: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      "${ApiConstants.baseImgUrl}/${movie.posterPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  movie.releaseDateParsed ?? "",
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 4),
                          MovieAverageWidget(average: movie.voteAverage)
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        movie.overview ?? "",
                        style: const TextStyle(fontSize: 14),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
