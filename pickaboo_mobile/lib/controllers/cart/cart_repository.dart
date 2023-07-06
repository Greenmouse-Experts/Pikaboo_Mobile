import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class CartRopsitory {
  final _api = Api();

  Future<ApiResponse> addToCart(
      String productId, String quantity, WidgetRef ref) async {
    final response = _api.postData('/home-residence/cart/add',
        data: {'product_id': productId, 'quantity': quantity}, ref: ref);
    return response;
  }

  Future<ApiResponse> viewCart(WidgetRef ref) async {
    final response = _api.getData('/home-residence/cart/view', ref: ref);
    return response;
  }
}
