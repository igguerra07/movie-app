import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String key;
  final String type;
  final String title;

  const VideoEntity({
    required this.key,
    required this.type,
    required this.title,
  });

  @override
  List<Object> get props => [title];

  @override
  bool get stringify => true;
}
