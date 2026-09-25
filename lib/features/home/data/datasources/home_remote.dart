import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_app/core/constant/backend_endpoints.dart';
import 'package:fruit_hub_app/core/error/app_exceptions.dart';
import 'package:fruit_hub_app/features/home/data/models/product_model.dart';

abstract class HomeRemote {
  Future<List<ProductModel>> getProducts();
  Future<List<ProductModel>> getBestSellingProducts();
}

class FireBaseHomeRemote implements HomeRemote {
  final db = FirebaseFirestore.instance.collection(BackendEndPoints.dbProduct);
  @override
  Future<List<ProductModel>> getBestSellingProducts() async {
    try {
      final res = await db.orderBy('sellingCount', descending: true).get();

      final data = res.docs.map((e) {
        return ProductModel.fromMap(e.data());
      }).toList();

      return data;
    } catch (e) {
      throw ServerException(
        message: 'فشل في جلب المنتجات الأكثر مبيعًا',
      );
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final res = await db.get();
      final data = res.docs.map((e) {
        return ProductModel.fromMap(e.data());
      }).toList();
      return data;
    } catch (e) {
      throw ServerException(message: "فشل في جلب المنتجات");
    }
  }
}
