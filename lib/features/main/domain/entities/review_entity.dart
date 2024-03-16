import 'package:equatable/equatable.dart';

class ReviewEntity extends Equatable {
  final String name;
  final int stars;
  final DateTime date;
  final String? description;

  const ReviewEntity({
    required this.name,
    required this.stars,
    required this.date,
    this.description,
  });

  @override
  List<Object?> get props => [
        name,
        stars,
        date,
        description,
      ];
}
