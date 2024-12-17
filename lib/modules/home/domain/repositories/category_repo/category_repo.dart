import 'package:dartz/dartz.dart';

import 'package:pos_flutter/core/api/failure.dart';

import 'package:pos_flutter/modules/home/data/datasource/home_remote_datasource.dart';
import 'package:pos_flutter/modules/home/data/models/category_model/category_model.dart';

class CategoryRepo {
  final HomeRemoteDatasource _homeRemoteDatasource = HomeRemoteDatasource();

  Future<Either<List<CategoryModel>, Failure>> getCategories() async {
    try {
      final response = await _homeRemoteDatasource.getCategories();
      Either<List<CategoryModel>, Failure> result = response.fold((l) {
        final allCategories = l.data["data"];
        List<CategoryModel> categories = [];
        if (allCategories != null) {
          categories = allCategories
              .map<CategoryModel>((e) => CategoryModel.fromJson(e))
              .toList();
        }
        print("${categories.length} + 22222222222");
        return Left(categories);
      }, (failure) => Right(failure));
      return result;
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
}
