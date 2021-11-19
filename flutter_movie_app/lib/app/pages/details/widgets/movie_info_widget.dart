import 'package:flutter/material.dart';
import 'package:flutter_movie_app/app/core/widgets/movie_average_widget.dart';

class MovieInfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double? average;

  const MovieInfoWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.average = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      trailing: MovieAverageWidget(average: average,),
    );
  }
}
