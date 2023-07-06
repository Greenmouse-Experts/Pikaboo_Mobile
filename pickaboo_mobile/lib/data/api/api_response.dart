import 'dart:convert';
import 'package:dio/dio.dart';

enum ApiStatus {
  success,
  failure,
}

class ApiResponse {
  int? code;
  dynamic data;
  final bool isSuccessful;
  String? message;
  String? token;
  dynamic error;

  ApiResponse({
    this.code,
    this.message,
    this.data,
    required this.isSuccessful,
    this.token,
    this.error,
  });

  factory ApiResponse.fromResponse(Response response) {
    final json = response.data;

    return ApiResponse(
        message: json['message'],
        isSuccessful: json['success'],
        data: json['data'],
        token: json['token'],
        error: json['error']);
  }

  factory ApiResponse.fromBody(String json, bool success, [String? token]) {
    final jsonD = jsonDecode(json);

    return ApiResponse(
        message: jsonD['message'],
        isSuccessful: success,
        data: jsonD['data'],
        token: token,
        error: jsonD['error']);
  }

  factory ApiResponse.timeout() {
    return ApiResponse(
      data: null,
      isSuccessful: false,
      message: 'Network error occurred. Please try again later.',
    );
  }
}

class NewApiError {
  final String message;
  final int statusCode;

  NewApiError(this.message, this.statusCode);

  factory NewApiError.fromObject(dynamic object) {
    final errorMessage =
        object['message'] as String? ?? 'Unknown error occurred';
    final statusCode = object['statusCode'] as int? ?? 0;
    return NewApiError(errorMessage, statusCode);
  }

  @override
  String toString() {
    return message;
  }
}

extension ApiError on DioException {
  ApiResponse toApiError({CancelToken? cancelToken}) {
    ApiResponse apiResponse = ApiResponse(isSuccessful: false);
    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        if (cancelToken != null) {
          cancelToken.cancel();
        }
        return ApiResponse(
          isSuccessful: false,
          data: null,
          message: "Please check your internet connection or try again later.",
        );
      case DioExceptionType.unknown:
        return ApiResponse(
          isSuccessful: false,
          data: null,
          message: "Please help report this error to Pikaboo support.",
        );
      case DioExceptionType.badResponse:
        final response2 = response;

        if (response2 != null) {
          if (response2.data is Map<String, dynamic>) {
            final val = response2.data;
            return ApiResponse(
              isSuccessful: false,
              message: val['message'] ?? val['error'].values.first[0],
            );
          } else {
            ApiResponse(
              isSuccessful: false,
              data: null,
              message: response2.data.toString(),
            );
          }

          if (response2.statusCode! >= 300 && response2.statusCode! <= 399) {
            apiResponse.message = error.toString();
          }

          if (response2.statusCode! >= 400 && response2.statusCode! <= 499) {
            apiResponse.message = error.toString();
          }

          if (response2.statusCode! >= 500 && response2.statusCode! <= 599) {
            apiResponse.message = error.toString();
          }
        }
        break;
      default:
        apiResponse = response != null
            ? ApiResponse.fromResponse(response!)
            : ApiResponse(
                isSuccessful: false,
                data: null,
                message: error.toString(),
              );
        break;
    }
    return apiResponse;
  }
}
