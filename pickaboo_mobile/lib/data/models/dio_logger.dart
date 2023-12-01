import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print('\x1b[32m[REQUEST] ${options.method} ${options.uri}\x1b[0m');
    }
    if (kDebugMode) {
      print('\x1b[33mHeaders: ${options.headers}\x1b[0m');
    }
    if (kDebugMode) {
      print('\x1b[34mBody: ${options.data}\x1b[0m');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          '\x1b[32m[RESPONSE] ${response.statusCode} ${response.requestOptions.uri}\x1b[0m');
    }
    if (kDebugMode) {
      print('\x1b[33mHeaders: ${response.headers}\x1b[0m');
    }
    if (kDebugMode) {
      print('\x1b[34mBody: ${response.data}\x1b[0m');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print('\x1b[31m[ERROR] ${err.message}\x1b[0m');
    }
    super.onError(err, handler);
  }
}
