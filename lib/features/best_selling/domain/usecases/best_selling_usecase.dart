import '../entities/best_selling_entity.dart';
import '../repositories/best_selling_repo.dart';

class BestSellingUseCase {
  final BestSellingRepo repository;

  BestSellingUseCase({
    required this.repository,
  });

  Future<BestSellingEntity> call() async {
    return repository.getBestSelling();
  }
}