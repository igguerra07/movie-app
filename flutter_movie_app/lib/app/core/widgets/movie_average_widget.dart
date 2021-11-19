import 'package:flutter/material.dart';

class MovieAverageWidget extends StatelessWidget {
  final double? average;

  const MovieAverageWidget({
    Key? key,
    this.average = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        "$average",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
