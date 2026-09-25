import 'package:fruit_hub_app/features/home/data/models/product_model.dart';

abstract class HomeRemote {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getBestSellingProducts();
}

class FireBaseHomeRemote implements HomeRemote {
  @override
  Future<List<ProductModel>> getBestSellingProducts() async {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}
