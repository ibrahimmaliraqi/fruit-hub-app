// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:fruit_hub_app/features/home/data/models/review_model.dart';
import 'package:fruit_hub_app/features/home/domain/entities/product_entity.dart';

class ProductModel {
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
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.price,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.image,
    required this.isFeatured,
    required this.isOrganic,
    required this.reviews,
  });
  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      expirationsMonths: entity.expirationsMonths,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      image: entity.image,
      isFeatured: entity.isFeatured,
      isOrganic: entity.isOrganic,
      reviews: entity.reviews
          .map(
            (review) => ReviewModel.fromEntity(review),
          )
          .toList(),
    );
  }
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'reviews': reviews.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      code: map['code'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      price: map['price'] as num,
      expirationsMonths: map['expirationsMonths'] as int,
      numberOfCalories: map['numberOfCalories'] as int,
      unitAmount: map['unitAmount'] as int,
      image: map['image'],
      isFeatured: map['isFeatured'] as bool,
      isOrganic: map['isOrganic'] as bool,
      reviews: List<ReviewModel>.from(
        (map['reviews'] as List<int>).map<ReviewModel>(
          (x) => ReviewModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  ProductModel copyWith({
    String? name,
    String? code,
    String? description,
    String? imageUrl,
    num? price,
    int? expirationsMonths,
    int? numberOfCalories,
    int? unitAmount,
    File? image,
    bool? isFeatured,
    bool? isOrganic,
    List<ReviewModel>? reviews,
  }) {
    return ProductModel(
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      expirationsMonths: expirationsMonths ?? this.expirationsMonths,
      numberOfCalories: numberOfCalories ?? this.numberOfCalories,
      unitAmount: unitAmount ?? this.unitAmount,
      image: image ?? this.image,
      isFeatured: isFeatured ?? this.isFeatured,
      isOrganic: isOrganic ?? this.isOrganic,
      reviews: reviews ?? this.reviews,
    );
  }
}
