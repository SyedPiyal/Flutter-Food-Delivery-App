import 'dart:developer';

import 'package:dio/dio.dart';

class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add any custom logic before sending the request
    log("✅ Request to: ${options.uri}\n \t  ➡️ with data: ${options.data}");
    handler.next(options); // Continue with the request
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Add any custom logic after receiving the response
    log(
        "✅ Response from: ${response.requestOptions.uri} \n \t  ➡️ status Code: ${response.statusCode}");
    log(
        "✅ Response from: ${response.requestOptions.uri} \n \t  ➡️ data: ${response.data}");
    handler.next(response); // Continue with the response
  }

  @override
  void onError(DioException e, ErrorInterceptorHandler handler) {
    // Handle errors globally
    log("❌ Error occurred: ${e.message}");
    handler.next(e); // Continue with the error
  }
}
