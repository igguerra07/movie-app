import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerItem extends StatelessWidget {
  final String trailerKey;
  final String trailerTitle;
  final VoidCallback onClickTrailer;

  const TrailerItem({
    Key? key,
    required this.trailerKey,
    required this.trailerTitle,
    required this.onClickTrailer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClickTrailer(),
      child: Row(
        children: [
          Image.network(
            YoutubePlayer.getThumbnail(videoId: trailerKey),
            width: 120,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Text(
              trailerTitle,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
