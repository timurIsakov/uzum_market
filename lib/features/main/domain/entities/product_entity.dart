import 'package:equatable/equatable.dart';

import 'review_entity.dart';
import 'seller_entity.dart';

class ProductEntity extends Equatable {
  final int id;
  final List<String> images;
  final String title;
  final double stars;
  final int countReviews;
  final int orders;
  final double price;
  final double oldPrice;
  final double priceInstallments;
  final int inStock;
  final int boughtWeek;
  final String description;
  final ReviewEntity? reviews;
  final SellerEntity seller;

  const ProductEntity(
      {required this.id,
      required this.images,
      required this.title,
      required this.stars,
      required this.countReviews,
      required this.orders,
      required this.price,
      required this.oldPrice,
      required this.priceInstallments,
      required this.inStock,
      required this.boughtWeek,
      required this.description,
      this.reviews,
      required this.seller});

  @override
  List<Object?> get props => [
        images.length,
        title,
        stars,
        countReviews,
        orders,
        price,
        oldPrice,
        priceInstallments,
        inStock,
        boughtWeek,
        description,
        reviews,
        seller,
      ];
}
