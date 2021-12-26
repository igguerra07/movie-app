import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/data/entities/video_entity.dart';
import 'package:flutter_movie_app/app/pages/trailers/widgets/trailer_item.dart';

class TrailerList extends StatelessWidget {
  final List<VideoEntity> trailers;
  final Function(VideoEntity trailer) onClickTrailer;

  const TrailerList({
    Key? key,
    required this.trailers,
    required this.onClickTrailer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: trailers.length,
      itemBuilder: (_, index) => TrailerItem(
        trailerKey: trailers[index].key,
        trailerTitle: trailers[index].title,
        onClickTrailer: () => onClickTrailer(trailers[index]),
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
    );
  }
}
