import 'package:equatable/equatable.dart';

import '../../../main/domain/entities/product_entity.dart';

class UserEntity extends Equatable {
  final String name;
  final String serName;
  final String phoneNumber;
  final String? photo;
  final DateTime dateOfBirth;
  final String floor;
  final List<ProductEntity> products;
  final List<ProductEntity> favoriteProducts;

  const UserEntity(
      {required this.name,
      required this.serName,
      required this.phoneNumber,
      this.photo,
      required this.dateOfBirth,
      required this.floor,
      required this.products,
      required this.favoriteProducts});

  @override
  List<Object?> get props => [
        name,
        serName,
        phoneNumber,
        photo,
        dateOfBirth,
        floor,
        products.length,
        favoriteProducts.length,
      ];
}
