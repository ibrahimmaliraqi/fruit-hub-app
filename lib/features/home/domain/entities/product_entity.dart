import 'dart:io';

import 'package:fruit_hub_app/features/home/domain/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final String? imageUrl;
  final num price;
  final int expirationsMonths;
  final int numberOfCalories;
  final int unitAmount;
  final File image;
  final bool isFeatured;
  final bool isOrganic;
  final List<ReviewEntity> reviews;

  ProductEntity({
    this.imageUrl,
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.image,
    required this.isFeatured,
    required this.isOrganic,
    required this.reviews,
  });
}
