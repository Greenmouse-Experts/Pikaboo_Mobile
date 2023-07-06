import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import '../../widgets/widgets.dart';
import 'cart_repository.dart';

final cartProvider = ChangeNotifierProvider<CartNotifier>((ref) {
  return CartNotifier();
});

class CartNotifier extends ChangeNotifier {
  final _repo = CartRopsitory();

  bool _isButtonLoading = false;
  bool get isButtonLoading => _isButtonLoading;

  List<CartSchema> _cart = [];
  List<CartSchema> get cart => _cart;

  List<String> _localCart = [];
  List<String> get localCart => _localCart;

  Future<void> addToCart(
      {required BuildContext context,
      required WidgetRef ref,
      required String productId,
      required String quantity}) async {
    _isButtonLoading = true;
    notifyListeners();
    try {
      _repo.addToCart(productId, quantity, ref).then((response) {
        if (response.isSuccessful) {
          _isButtonLoading = false;
          _localCart = [...localCart, productId];
          notifyListeners();
          AppOverlays.showSuccessSnackBar(
              context: context,
              message:
                  response.message ?? 'Product Added to Cart Successfully');
        } else {
          _isButtonLoading = false;
          notifyListeners();
          AppOverlays.showErrorSnackBar(
              context: context,
              message: response.message ?? 'An Unknown error occurred');
        }
      });
    } catch (e) {
      _isButtonLoading = false;
      notifyListeners();
      AppOverlays.showErrorSnackBar(context: context, message: e.toString());
    }
  }

  Future<void> viewCart({required WidgetRef ref}) async {
    try {
      final response = await _repo.viewCart(ref);
      if (response.isSuccessful) {
        _cart = CartSchema.getList(response.data);
      }
    } catch (e) {
      rethrow;
    }
  }
}
