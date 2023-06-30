import 'dart:convert';

import 'package:dio/dio.dart';

import '../constants.dart';
import 'api_response.dart';

class Api {
  static const baseUrl = Constants.baseUrl;

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        "Accept": "application/json",
      },
    ),
  );

  Future<ApiResponse> getData(String endpoint,
      {Map<String, dynamic>? queryParameters,
      CancelToken? cancelToken,
      bool hasHeader = true}) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      return ApiResponse.fromResponse(response);
    } on DioException catch (error) {
      return error.toApiError(cancelToken: CancelToken());
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> postData(String endpoint,
      {required dynamic data,
      CancelToken? cancelToken,
      bool hasHeader = true}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        cancelToken: cancelToken,
      );

      return ApiResponse.fromResponse(response);
    } on DioException catch (error) {
      return error.toApiError(cancelToken: CancelToken());
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> patchData(String endpoint,
      {required dynamic data, bool hasHeader = true}) async {
    try {
      final response = await _dio.patch(endpoint, data: jsonDecode(data));
      return ApiResponse.fromResponse(response);
    } on DioException catch (error) {
      return error.toApiError(cancelToken: CancelToken());
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> putData(String endpoint,
      {required dynamic data,
      CancelToken? cancelToken,
      bool hasHeader = true}) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: jsonEncode(data),
        cancelToken: cancelToken,
      );
      return ApiResponse.fromResponse(response);
    } on DioException catch (error) {
      return error.toApiError(cancelToken: CancelToken());
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse> delete(String endpoint,
      {required dynamic data,
      CancelToken? cancelToken,
      bool hasHeader = true}) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: jsonEncode(data),
        cancelToken: cancelToken,
      );
      return ApiResponse.fromResponse(response);
    } on DioException catch (error) {
      return error.toApiError(cancelToken: CancelToken());
    } catch (e) {
      rethrow;
    }
  }
}