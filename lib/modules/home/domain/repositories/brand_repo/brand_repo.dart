import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pos_flutter/core/api/dio_helper.dart';
import 'package:pos_flutter/core/api/failure.dart';
import 'package:pos_flutter/core/api/response_model.dart';
import 'package:pos_flutter/core/utils/strings/constants.dart';
import 'package:pos_flutter/core/utils/strings/end_points.dart';
import 'package:pos_flutter/modules/home/data/datasource/home_remote_datasource.dart';
import 'package:pos_flutter/modules/home/data/models/brand_model/brand_model.dart';

class BrandRepo {
  final HomeRemoteDatasource _homeRemoteDatasource = HomeRemoteDatasource();

  Future<Either<List<BrandModel>, Failure>> getBrands() async {
    try {
      final response = await _homeRemoteDatasource.getBrands();
      Either<List<BrandModel>, Failure> result = response.fold((l) {
        final allBrands = l.data["data"];
        List<BrandModel> brands = [];
        if (allBrands != null) {
          brands =
              allBrands.map<BrandModel>((e) => BrandModel.fromJson(e)).toList();
        }
        print("${brands.length} + 22222222222");
        return Left(brands);
      }, (failure) => Right(failure));
      return result;
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
}
