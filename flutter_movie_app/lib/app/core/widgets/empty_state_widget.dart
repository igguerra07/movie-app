import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class EmptyStateWidget extends StatelessWidget {
  final DioErrorType type;
  final String message;
  //retry
  //back

  const EmptyStateWidget({
    Key? key,
    required this.type,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
          child: Text(message)
      ),
    );
  }
}
