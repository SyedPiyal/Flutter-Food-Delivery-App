import 'package:dio/dio.dart';
import 'package:food_app/utils/api_consts.dart';

import '../service/interceptor.dart';

class ApiClient {
  final Dio _dio;

  ApiClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: AppApiConstants.baseUrl,
            connectTimeout: const Duration(minutes: 5),
            receiveTimeout: const Duration(minutes: 5),
            headers: {
              'Content-Type': 'application/json',
              'Accept-Type': 'application/json'
            },
          ),
        ) {
    // Add the interceptor
    _dio.interceptors.add(ApiInterceptor());
  }

  ///
  /// Get Request
  ///
  Future<Response> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    }
  }

  ///
  /// Post Request
  ///

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to post data: ${e.message}');
    }
  }

  ///
  /// Put Request
  ///
  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to update data: ${e.message}');
    }
  }

  ///
  /// Delete Request
  ///
  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to delete data: ${e.message}');
    }
  }
}
