import 'package:dio/dio.dart';

class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('\x1b[32m[REQUEST] ${options.method} ${options.uri}\x1b[0m');
    print('\x1b[33mHeaders: ${options.headers}\x1b[0m');
    print('\x1b[34mBody: ${options.data}\x1b[0m');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('\x1b[32m[RESPONSE] ${response.statusCode} ${response.requestOptions.uri}\x1b[0m');
    print('\x1b[33mHeaders: ${response.headers}\x1b[0m');
    print('\x1b[34mBody: ${response.data}\x1b[0m');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    print('\x1b[31m[ERROR] ${error.message}\x1b[0m');
    super.onError(error, handler);
  }
}
