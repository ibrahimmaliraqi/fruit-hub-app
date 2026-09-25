import 'package:dartz/dartz.dart';
import 'package:fruit_hub_app/core/error/app_exceptions.dart';

import 'package:fruit_hub_app/core/error/failure.dart';
import 'package:fruit_hub_app/features/home/data/datasources/home_remote.dart';

import 'package:fruit_hub_app/features/home/domain/entities/product_entity.dart';

import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemote homeRemote;

  HomeRepoImpl({required this.homeRemote});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      final res = await homeRemote.getBestSellingProducts();
      final data = res.map((e) => e.toEntity()).toList();
      return right(data);
    } on AppExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final res = await homeRemote.getProducts();
      final data = res.map((e) => e.toEntity()).toList();
      return right(data);
    } on AppExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }
}
