import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/core/constants/api_constants.dart';
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
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle( fontWeight: FontWeight.bold),
                      ),
                      Text(
                        movie.overview ?? "",
                        style: const TextStyle(fontSize: 12),
                        maxLines: 5,
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
