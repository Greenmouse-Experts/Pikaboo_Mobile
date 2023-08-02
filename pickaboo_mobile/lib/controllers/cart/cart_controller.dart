import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../auth/auth_controller.dart';
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

  double _cartTotal = 0;
  double get cartTotal => _cartTotal;

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

  void _calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in _cart) {
      String cleanedPrice =
          item.price?.replaceAll(',', '').split('.')[0] ?? '0';
      int itemPrice = int.parse(cleanedPrice);
      totalPrice += itemPrice;
    }
    _cartTotal = totalPrice.toDouble();
  }

  Future<void> updateCart(
      {required BuildContext context,
      required WidgetRef ref,
      required int cartId,
      required String price,
      required String quantity}) async {
    try {
      _repo.updateCart(cartId.toString(), quantity, ref).then((response) {
        if (!response.isSuccessful) {
          AppOverlays.showErrorSnackBar(
              context: context,
              message: response.message ?? 'An unknown error occurred');
        } else {
          final cartIndex = _cart.indexWhere((element) => element.id == cartId);
          final cartItem = _cart[cartIndex];
          cartItem.price = price;
          cartItem.quantity = quantity;
          _cart[cartIndex] = cartItem;
          _calculateTotalPrice();
          notifyListeners();

          AppOverlays.showSuccessSnackBar(
              context: context,
              message: response.message ?? 'Cart updated successfully');
        }
      });
    } catch (e) {
      AppOverlays.showErrorSnackBar(context: context, message: e.toString());
    }
  }

  Future<void> viewCart({required WidgetRef ref}) async {
    try {
      final response = await _repo.viewCart(ref);
      if (response.isSuccessful) {
        _cart = CartSchema.getList(response.data);
        _localCart.clear();
        for (CartSchema item in _cart) {
          _localCart.add(item.product?.id.toString() ?? '');
        }
        _calculateTotalPrice();
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeCartItem(
      {required WidgetRef ref,
      required BuildContext context,
      required int id}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      _repo.removeCartItem(id.toString(), ref).then((response) {
        context.pop();
        if (response.isSuccessful) {
          _cart.removeWhere((element) => element.id == id);
          _calculateTotalPrice();
          notifyListeners();
          AppOverlays.showSuccessSnackBar(
              context: context,
              message: response.message ?? 'Item removed successfully');
        } else {
          AppOverlays.showErrorSnackBar(
              context: context,
              message: response.message ?? 'An uknown error occurred');
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorSnackBar(context: context, message: e.toString());
    }
  }

  Future<void> checkOut(
      {required WidgetRef ref,
      required BuildContext context,
      required String address}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      _repo.checkOut(address, ref).then((response) {
        context.pop();
        if (response.isSuccessful) {
          ref.read(authProvider.notifier).refreshUser(ref: ref);
          _cart.clear();
          context.goNamed(AppRouter.orderStatusView);
        } else {
          AppOverlays.showErrorSnackBar(
              context: context,
              message: response.message ?? 'An unknoown error occured');
        }
      });
    } catch (e) {
      AppOverlays.showErrorSnackBar(context: context, message: e.toString());
    }
  }
}
