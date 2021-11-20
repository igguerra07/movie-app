import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/app/core/constants/api_constants.dart';
import 'package:flutter_movie_app/app/core/widgets/loading_widget.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/cast_cubit.dart';
import 'package:flutter_movie_app/app/pages/details/cubit/cast_state.dart';

class MovieCastWidget extends StatelessWidget {
  final int movieId;
  final CastCubit castCubit;
  const MovieCastWidget({
    Key? key,
    required this.movieId,
    required this.castCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: castCubit..getMovieCast(movieId),
      builder: (context, state) {
        if(state is CastLoadingState) {
          return const LoadingWidget();
        }
        if(state is CastSuccessState) {
          return SizedBox(
            height: 160,
            child:  ListView.separated(
              padding: const EdgeInsets.all(16),
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              scrollDirection: Axis.horizontal,
              itemCount: state.movieCast.length,
              itemBuilder: (context, index) {
                final cast = state.movieCast[index];
                final castPhoto = "${ApiConstants.baseImgUrl}/${cast.profilePath}";
                return SizedBox(
                  width: 80,
                  height: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: SizedBox(
                            width: 80,
                            height: 160,
                            child: Image.network(
                              castPhoto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: 80,
                        child: Text(
                          cast.name,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 12
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        child: Text(
                          cast.character,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        if(state is CastFailureState) {
          return Text(state.error.message);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
