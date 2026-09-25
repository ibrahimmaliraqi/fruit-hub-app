import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/failure.dart';
import 'package:fruit_hub_app/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hub_app/features/home/domain/repositories/home_repo.dart';

class GetProductsUsecase {
  final HomeRepo homeRepo;

  GetProductsUsecase({required this.homeRepo});
  Future<Either<Failure, List<ProductEntity>>> call() {
    return homeRepo.getProducts();
  }
}
