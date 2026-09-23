import '../../domain/entities/best_selling_entity.dart';
import '../../domain/repositories/best_selling_repo.dart';

class BestSellingRepoImpl implements BestSellingRepo {
  @override
  Future<BestSellingEntity> getBestSelling() async {
    throw UnimplementedError();
  }
}