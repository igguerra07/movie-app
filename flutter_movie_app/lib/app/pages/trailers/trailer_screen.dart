import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/core/di/get_it.dart';
import 'package:flutter_movie_app/app/data/entities/trailers_params.dart';
import 'package:flutter_movie_app/app/data/entities/video_entity.dart';
import 'package:flutter_movie_app/app/pages/trailers/cubit/trailer_cubit.dart';
import 'package:flutter_movie_app/app/pages/trailers/cubit/trailer_state.dart';
import 'package:flutter_movie_app/app/pages/trailers/widgets/trailer_item.dart';
import 'package:flutter_movie_app/app/pages/trailers/widgets/trailer_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailersScreen extends StatefulWidget {
  final TrailersParams params;

  const TrailersScreen({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  _TrailersScreenState createState() => _TrailersScreenState();
}

class _TrailersScreenState extends State<TrailersScreen> {
  final TrailersCubit _trailersCubit = getIt();
  late YoutubePlayerController _controller;

  int get _movidId => widget.params.movieId;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: "0BZUMD85S7s",
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _trailersCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie Trailer")),
      body: BlocBuilder<TrailersCubit, TrailersState>(
        bloc: _trailersCubit..getMovieTrailers(movieId: _movidId),
        builder: (context, state) {
          if (state is TrailerLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is TrailerFailureState) {
            return Center(child: Text(state.error.message));
          }
          if (state is TrailerSuccessState) {
            return YoutubePlayerBuilder(
              player: YoutubePlayer(
                controller: _controller,
                aspectRatio: 16 / 9,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
              builder: (context, player) {
                return Column(
                  children: [
                    player,
                    Expanded(
                      child: TrailerList(
                        trailers: state.trailers,
                        onClickTrailer: _onClickTrailer,
                      )
                    ),
                  ],
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _onClickTrailer(VideoEntity trailer) {
    _controller.load(trailer.key);
    _controller.play();
  }
}
