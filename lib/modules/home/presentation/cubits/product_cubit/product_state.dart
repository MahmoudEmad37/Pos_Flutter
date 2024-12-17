import 'package:pos_flutter/modules/home/data/models/product_model/product_model.dart';

abstract class ProductState {}

class InitState extends ProductState {}

class GetProductLoadingState extends ProductState {}

class GetProductSuccessState extends ProductState {
  final List<ProductModel> products;

   GetProductSuccessState(this.products);
}

class GetProductErrorState extends ProductState {
  final String message;

   GetProductErrorState(this.message);
}
