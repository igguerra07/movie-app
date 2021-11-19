import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/core/constants/api_constants.dart';

class MovieBackdropWidget extends StatelessWidget {
  final String posterPath;

  String get _posterPath => "${ApiConstants.baseImgUrl}$posterPath";

  const MovieBackdropWidget({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black26,
            Colors.black87,
          ],
        ),
      ),
      child: Image.network(
        _posterPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
