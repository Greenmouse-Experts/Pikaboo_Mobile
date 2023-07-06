import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import 'product_repo.dart';

final productProvider = ChangeNotifierProvider<ProductNotifier>((ref) {
  return ProductNotifier();
});

class ProductNotifier extends ChangeNotifier {
  final _repo = ProductRepository();

  List<ProductsSchema> _products = [];
  List<ProductsSchema> get products => _products;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Meta? _meta;
  Meta? get meta => _meta;

  Links? _links;
  Links? get links => _links;

  Future<void> getAllProducts({required WidgetRef ref}) async {
    try {
      final response = await _repo.getAllProducts(ref: ref, keyword: '');

      if (response.isSuccessful) {
        final data = MarketSchema.fromJson(response.data);
        _products = data.data ?? [];
        _meta = data.meta;
        _links = data.links;
      }
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
  }
}
