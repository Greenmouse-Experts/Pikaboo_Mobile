import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import 'auth_repo.dart';

final authProvider = ChangeNotifierProvider<_AuthNotifier>((ref) {
  return _AuthNotifier();
});

class _AuthNotifier extends ChangeNotifier {
  final _repo = AuthRepository();

  HomeOwnerSchema? _homeOwner;
  HomeOwnerSchema? get homeOwner => _homeOwner;

  Future<void> homeOwnerLogin({
    required BuildContext context,
    required String phone,
    required String otp,
  }) async {
    AppOverlays.loadingDialog(context: context);
    try {
      final payload = _getUserLoginPayload(phone: phone, otp: otp);
      _repo.login(payload).then((response) {
        if (response.isSuccessful) {
          context.pop();
          _homeOwner = HomeOwnerSchema.fromJson(response.data);
          context.goNamed(AppRouter.userDashboard);
        } else {
          context.pop();
          AppOverlays.showErrorDialog(
              context: context, error: response.message);
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorDialog(context: context, error: e);
    }
  }

  Future<void> forgotPassword(
      {required BuildContext context, required String phone}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      _repo.forgotPassword(phone).then((response) {
        if (response.isSuccessful) {
          context.pop();
          context.pushReplacementNamed(AppRouter.resetStatus,
              pathParameters: {'phone': phone});
        } else {
          context.pop();
          AppOverlays.showErrorDialog(
              context: context, error: response.message);
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorDialog(context: context, error: e);
    }
  }

  void logout({required BuildContext context}) {
    context.goNamed(AppRouter.dashboard);
    _homeOwner == null;
  }

  Map<String, String> _getUserLoginPayload({
    required String phone,
    required String otp,
  }) {
    return {'phone_number': phone, 'otp': otp};
  }
}
