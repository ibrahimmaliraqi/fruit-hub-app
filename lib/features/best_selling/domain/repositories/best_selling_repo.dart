import '../entities/best_selling_entity.dart';

abstract class BestSellingRepo {
  Future<BestSellingEntity> getBestSelling();
}