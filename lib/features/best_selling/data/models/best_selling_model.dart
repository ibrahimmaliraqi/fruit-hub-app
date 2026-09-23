import '../../domain/entities/best_selling_entity.dart';

class BestSellingModel extends BestSellingEntity {
  BestSellingModel({
    required super.id,
  });

  factory BestSellingModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return BestSellingModel(
      id: map['id'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}