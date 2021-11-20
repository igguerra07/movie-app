import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final String name;
  final String creditId;
  final String character;
  final String profilePath;

  const CastEntity({
    required this.name,
    required this.creditId,
    required this.character,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [creditId, name];
}