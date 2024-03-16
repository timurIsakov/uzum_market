import 'package:equatable/equatable.dart';

class SellerEntity extends Equatable {
  final String name;
  final double stars;
  final int assessment;
  final String image;

  const SellerEntity(
      {required this.name,
      required this.stars,
      required this.assessment,
      required this.image});

  @override
  List<Object?> get props => [
        name,
        stars,
        assessment,
        image,
      ];
}
