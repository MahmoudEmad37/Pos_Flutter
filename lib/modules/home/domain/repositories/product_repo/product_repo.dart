import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pos_flutter/core/api/dio_helper.dart';
import 'package:pos_flutter/core/api/failure.dart';
import 'package:pos_flutter/core/api/response_model.dart';
import 'package:pos_flutter/core/utils/strings/constants.dart';
import 'package:pos_flutter/core/utils/strings/end_points.dart';

class ProductRepo {
  final DioHelper _dio = DioHelper();
  Future<Either<ResponseModel, Failure>> getAllProducts(
      {required int page}) async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getAllProducts,
        query: {
          "per_page": page,
          "location_id": Constants.locationId,
        },
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }
}
