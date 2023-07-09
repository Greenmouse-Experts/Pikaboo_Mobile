import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class ProductRepository {
  final _api = Api();

  Future<ApiResponse> getAllProducts(
      {required WidgetRef ref, required String keyword}) async {
    final response = _api.getData('/home-residence/get/products', ref: ref);
    return response;
  }

  Future<ApiResponse> searchProducts(
      {required WidgetRef ref, required String keyword}) async {
    final response =
        _api.getData('/home-residence/get/products?keyword=$keyword', ref: ref);
    return response;
  }

  Future<ApiResponse> handlePagination(
      {required WidgetRef ref, required String endpoint}) async {
    final response = _api.getData(endpoint, ref: ref);
    return response;
  }
}
