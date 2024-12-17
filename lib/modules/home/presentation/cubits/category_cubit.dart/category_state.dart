import 'package:pos_flutter/modules/home/data/models/category_model/category_model.dart';

abstract class CategoryState {}

class InitState extends CategoryState {}

class GetCategoryLoadingState extends CategoryState {}

class GetCategorySuccessState extends CategoryState {
  final List<CategoryModel> categories;

  GetCategorySuccessState(this.categories);
}

class GetCategoryErrorState extends CategoryState {
  final String message;

  GetCategoryErrorState(this.message);
}
