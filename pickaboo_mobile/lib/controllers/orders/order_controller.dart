import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/order_schema.dart';
import '../../data/models/single_order_schema.dart';
import 'order_repo.dart';

final orderProvider = ChangeNotifierProvider<OrderNotifier>((ref) {
  return OrderNotifier();
});

class OrderNotifier extends ChangeNotifier {
  final _repo = OrderRepository();

  List<OrderSchema> _orders = [];
  List<OrderSchema> get orders => _orders;

  Meta? _meta;
  Meta? get meta => _meta;

  Links? _links;
  Links? get links => _links;

  Future<void> getOrderHistory({required WidgetRef ref}) async {
    try {
      final response = await _repo.getOrderHistory(ref);

      if (response.isSuccessful) {
        final data = OrderHistorySchema.fromJson(response.data);
        _orders = data.data ?? [];
        _meta = data.meta;
        _links = data.links;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<SingleOrderSchema> viewSingleOrder(
      {required String id, required WidgetRef ref}) async {
    try {
      final response = await _repo.getSingleOrder(id, ref);
      return SingleOrderSchema.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
