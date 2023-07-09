import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class OrderRepository {
  final _api = Api();

  Future<ApiResponse> getOrderHistory(WidgetRef ref) async {
    final response =
        _api.getData('/home-residence/get/product/orders', ref: ref);
    return response;
  }

  Future<ApiResponse> getSingleOrder(String id, WidgetRef ref) async {
    final response = _api.getData(
        '/home-residence/view/product/order?product_order_id=$id',
        ref: ref);
    return response;
  }
}
