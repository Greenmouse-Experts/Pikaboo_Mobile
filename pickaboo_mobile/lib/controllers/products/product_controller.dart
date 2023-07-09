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

  Map<String, List<ProductsSchema>> _groupedProducts = {};
  Map<String, List<ProductsSchema>> get groupedProducts => _groupedProducts;

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
        _groupedProducts = groupProductsByCategory(_products);
      }
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
  }

  Future<List<ProductsSchema>> searchProducts(
      {required WidgetRef ref, required String keyword}) async {
    List<ProductsSchema> products = [];
    if (keyword.isEmpty) {
      return products;
    }
    try {
      final response = await _repo.searchProducts(ref: ref, keyword: keyword);

      if (response.isSuccessful) {
        final data = MarketSchema.fromJson(response.data);
        products = data.data ?? [];
      } else {
        products = [];
      }
      return products;
    } catch (e) {
      _isLoading = false;
      rethrow;
    }
  }

  Map<String, List<ProductsSchema>> groupProductsByCategory(
      List<ProductsSchema> products) {
    Map<String, List<ProductsSchema>> result = {'All': products};

    for (ProductsSchema prod in products) {
      String category = prod.name ?? '';
      if (!result.containsKey(category)) {
        result[category] = [];
      }
      result[category]?.add(prod);
    }

    return result;
  }
}
