import 'package:dartz/dartz.dart';

import 'package:fruit_hub_app/core/error/failure.dart';
import 'package:fruit_hub_app/features/home/data/datasources/home_remote.dart';

import 'package:fruit_hub_app/features/home/domain/entities/product_entity.dart';

import '../../domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemote homeRemote;

  HomeRepoImpl({required this.homeRemote});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
