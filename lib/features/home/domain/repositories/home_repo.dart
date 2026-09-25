import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/failure.dart';
import 'package:fruit_hub_app/features/home/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
