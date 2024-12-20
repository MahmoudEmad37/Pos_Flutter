import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pos_flutter/core/api/failure.dart';
import 'package:pos_flutter/core/api/response_model.dart';
import 'package:pos_flutter/core/utils/strings/constants.dart';

class DioHelper {
  static String kBaseUrl = dotenv.env['BASE_URL']!;

  final Dio _dio = Dio(BaseOptions(
    baseUrl: kBaseUrl,
    receiveDataWhenStatusError: true,
  ));

  //get
  Future get(
      {required String endPoint,
      Map<String, dynamic>? query,
      Map<String, dynamic> data = const {},
      String? token,
      ProgressCallback? onReceiveProgress}) async {
    try {
      _dio.options.headers = {
        'Authorization': "Bearer $token",
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      // print(endPoint);
      // print(token);
      return await _dio.get(endPoint,
          data: FormData.fromMap(data),
          queryParameters: query,
          onReceiveProgress: onReceiveProgress);
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.data != null) {
          throw ResponseModel.fromJson(error.response!.data);
        }
        throw Failure(error.response!.statusMessage!);
      } else {
        throw Failure(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw const Failure("Error connecting to internet");
    } on FormatException {
      throw const Failure("Format Exception");
    } on Error catch (e) {
      throw Failure("Error $e");
    }
  }

  /// post
  Future postRaw(
      {required String endPoint,
      Map<String, dynamic> data = const {},
      Map<String, dynamic>? query,
      String? token,
      ProgressCallback? onSendProgress}) async {
    try {
      _dio.options.headers = {
        'Authorization': "Bearer $token",
        "App-Language": Constants.lang
      };
      return await _dio.post(
        endPoint,
        data: jsonEncode(data),
        queryParameters: query,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.data != null) {
          if (kDebugMode) {
            print(error.response!.data);
          }
          throw ResponseModel.fromJson(error.response!.data);
        }
        throw Failure(error.response!.statusMessage!);
      } else {
        throw Failure(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw const Failure("Error connecting to internet");
    } on FormatException {
      throw const Failure("Format Exception");
    } on Error catch (e) {
      throw Failure("Error $e");
    }
  }

  Future post(
      {required String endPoint,
      Map<String, dynamic> data = const {},
      Map<String, dynamic>? query,
      String? token,
      ProgressCallback? onSendProgress}) async {
    try {
      _dio.options.headers = {
        'Content-Type': 'multipart/form-data',
        'Authorization': "Bearer $token",
        "App-Language": Constants.lang
      };
      return await _dio.post(
        endPoint,
        data: FormData.fromMap(data),
        queryParameters: query,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.data != null) {
          if (kDebugMode) {
            print(error.response!.data);
          }
          throw ResponseModel.fromJson(error.response!.data);
        }
        throw Failure(error.response!.statusMessage!);
      } else {
        throw Failure(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw const Failure("Error connecting to internet");
    } on FormatException {
      throw const Failure("Format Exception");
    } on Error catch (e) {
      throw Failure("Error $e");
    }
  }

  /// put
  Future putData(
      {required String endPoint,
      Map<String, dynamic> data = const {},
      Map<String, dynamic>? query,
      String? token,
      ProgressCallback? onSendProgress}) async {
    try {
      _dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
        "App-Language": Constants.lang
      };
      return await _dio.put(
        endPoint,
        data: FormData.fromMap(data),
        queryParameters: query,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.data != null) {
          throw ResponseModel.fromJson(error.response!.data);
        }
        throw Failure(error.response!.statusMessage!);
      } else {
        throw Failure(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw const Failure("Error connecting to internet");
    } on FormatException {
      throw const Failure("Format Exception");
    } on Error catch (e) {
      throw Failure("Error $e");
    }
  }

  //patch
  Future patchData(
      {required String endPoint,
      Map<String, dynamic> data = const {},
      Map<String, dynamic>? query,
      String? token,
      ProgressCallback? onSendProgress}) async {
    try {
      _dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token",
        "App-Language": Constants.lang
      };
      return await _dio.patch(
        endPoint,
        data: data,
        queryParameters: query,
        onSendProgress: onSendProgress,
      );
    } on DioException catch (error) {
      if (error.response != null) {
        print("error.response " + error.response.toString());
        if (error.response!.data != null) {
          throw ResponseModel.fromJson(error.response!.data);
        }
        throw Failure(error.response!.statusMessage!);
      } else {
        throw Failure(error.message ?? 'حدث خطأ');
      }
    } on SocketException {
      throw const Failure("Error connecting to internet");
    } on FormatException {
      throw const Failure("Format Exception");
    } on Error catch (e) {
      throw Failure("Error $e");
    }
  }
}
