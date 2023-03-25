import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../api_constants.dart';

class ApiServices {
  final Dio _dio;
  ApiServices()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiConstants.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ));

  Future<Response> getData(String path,
      {Map<String, dynamic>? queryParams}) async {
    try {
      _dio.options.headers = {};
      final response = await _dio.get(path, queryParameters: queryParams);
      return response;
    } on DioError catch (error) {
      throw _handleError(error);
    } catch (e) {
      rethrow;
    }
  }

  Exception _handleError(DioError error) {
    String errorMessage = "";
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        errorMessage = "timeOut";
        break;
      case DioErrorType.badResponse:
        errorMessage =
            "Bad Response ${error.response?.statusCode} ${error.response?.statusMessage}";
        break;
      default:
        errorMessage = "network message";
    }
    return Exception(errorMessage);
  }

  Future postData(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? body}) async {
    try {
      final response =
          _dio.post(path, queryParameters: queryParams, data: body);
      return response;
    } on DioError catch (error) {
      throw _handleError(error);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future updateData(String path,
      {Map<String, dynamic>? queryParams, Map<String, dynamic>? body}) async {
    try {
      final response = _dio.put(path, queryParameters: queryParams, data: body);
      return response;
    } on DioError catch (error) {
      throw _handleError(error);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
