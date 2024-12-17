import 'package:dartz/dartz.dart';
import 'package:pos_flutter/core/api/failure.dart';
import 'package:pos_flutter/modules/home/data/datasource/home_remote_datasource.dart';
import 'package:pos_flutter/modules/home/data/models/product_model/product_model.dart';

class ProductRepo {
  final HomeRemoteDatasource _homeRemoteDatasource = HomeRemoteDatasource();

  Future<Either<List<ProductModel>, Failure>> getProducts(
      {required int page, String? categoryId, String? brandId}) async {
    try {
      final response = await _homeRemoteDatasource.getProducts(
          page: page, categoryId: categoryId, brandId: brandId);
      Either<List<ProductModel>, Failure> result = response.fold((l) {
        final allProducts = l.data["data"];
        List<ProductModel> products = [];
        if (allProducts != null) {
          products = allProducts
              .map<ProductModel>((e) => ProductModel.fromJson(e))
              .toList();
        }
        print("${products.length} + 11111111111");
        return Left(products);
      }, (failure) => Right(failure));
      return result;
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
}
