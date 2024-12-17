import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pos_flutter/core/api/dio_helper.dart';
import 'package:pos_flutter/core/api/failure.dart';
import 'package:pos_flutter/core/api/response_model.dart';
import 'package:pos_flutter/core/utils/strings/constants.dart';
import 'package:pos_flutter/core/utils/strings/end_points.dart';

class HomeRemoteDatasource {
  final DioHelper _dio = DioHelper();

  Future<Either<ResponseModel, Failure>> getProducts(
      {required int page, String? categoryId, String? brandId}) async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getAllProducts,
        query: {
          "per_page": page,
          "location_id": Constants.locationId,
          "category_id": categoryId,
          "brand_id": brandId
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

  Future<Either<ResponseModel, Failure>> getBrands() async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getAllBrands,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ResponseModel, Failure>> getCategories() async {
    try {
      Response response = await _dio.get(
        token: Constants.token,
        endPoint: EndPoints.getAllCategories,
      );
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ResponseModel, Failure>> getContacts(
      {required int page}) async {
    try {
      Response response = await _dio.get(
          token: Constants.token,
          endPoint: EndPoints.getAllContact,
          query: {
            "per_page": page,
            "type": "customer",
          });
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      return Right(failure);
    }
  }

  Future<Either<ResponseModel, Failure>> addContact(
      {required String name,
      required String mobile,
      String? companyName,
      required String carNumber,
      required String carModel}) async {
    try {
      Response response = await _dio.postRaw(
          token: Constants.token,
          endPoint: EndPoints.getAllContact,
          data: {
            "type": "customer",
            "first_name": name,
            "mobile": mobile,
            "supplier_business_name": companyName,
            "custom_field1": carNumber,
            "custom_field2": carModel
          });
      print(response.data.toString());
      return Left(ResponseModel.fromJson(response.data));
    } on ResponseModel catch (responseModel) {
      return Left(responseModel);
    } on Failure catch (failure) {
      print(failure.message.toString());
      return Right(failure);
    }
  }
}
