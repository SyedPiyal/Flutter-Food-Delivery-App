import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(String baseUrl)
      : _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(minutes: 5),
    receiveTimeout: const Duration(minutes: 5),
  ));

  Future<Response> get(String endpoint, {Map<String, dynamic>? queryParameters}) async {
    try {
      return await _dio.get(endpoint, queryParameters: queryParameters);
    } on DioException catch (e) {
      throw Exception('Failed to load data: ${e.message}');
    }
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    try {
      return await _dio.post(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to post data: ${e.message}');
    }
  }

  Future<Response> put(String endpoint, {dynamic data}) async {
    try {
      return await _dio.put(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to update data: ${e.message}');
    }
  }

  Future<Response> delete(String endpoint, {dynamic data}) async {
    try {
      return await _dio.delete(endpoint, data: data);
    } on DioException catch (e) {
      throw Exception('Failed to delete data: ${e.message}');
    }
  }
}
