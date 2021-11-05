import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class AppError extends Equatable {
  final DioErrorType type;
  final String message;

  const AppError({ required this.type, required this.message });

  @override
  List<Object?> get props => [type, message];
}