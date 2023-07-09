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

  Future<ApiResponse> updateCart(
      String cartId, String quantity, WidgetRef ref) async {
    final response = _api.postData('/home-residence/cart/update',
        ref: ref, data: {'cart_id': cartId, 'quantity': quantity});
    return response;
  }

  Future<ApiResponse> removeCartItem(String id, WidgetRef ref) async {
    final response = _api.postData('/home-residence/cart/remove',
        data: {'cart_id': id}, ref: ref);
    return response;
  }

  Future<ApiResponse> checkOut(String address, WidgetRef ref) async {
    final response = _api.postData('/home-residence/make/payment',
        data: {'address': address}, ref: ref);
    return response;
  }
}
