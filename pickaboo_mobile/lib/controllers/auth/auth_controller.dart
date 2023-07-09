import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../cart/cart_controller.dart';
import 'auth_repo.dart';

final authProvider = ChangeNotifierProvider<_AuthNotifier>((ref) {
  return _AuthNotifier();
});

class _AuthNotifier extends ChangeNotifier {
  final _repo = AuthRepository();

  UserSchema? _user;
  UserSchema? get user => _user;

  String? _token;
  String? get token => _token;

  String? _wallet;
  String? get wallet => _wallet;

  int _notificationCount = 0;
  int get notificationCount => _notificationCount;

  String? _accountType;
  String? get accountType => _accountType;

  Future<void> userLogin(
      {required BuildContext context,
      required String phone,
      required String otp,
      required bool isUser,
      required WidgetRef ref}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      final payload = _getUserLoginPayload(phone: phone, otp: otp);
      _repo.login(payload, ref).then((response) {
        if (response.isSuccessful) {
          _user = UserSchema.fromJson(response.data);
          _notificationCount = _user?.notificationsCount ?? 0;

          if (!isUser) {
            if (_user?.accountType != 'Service Personnel') {
              context.pop();
              AppOverlays.showErrorDialog(
                  context: context,
                  error:
                      "Your account is a Home Resident account, You can't login as a Service Personnel");
              return;
            }
          } else {
            if (_user?.accountType == 'Service Personnel') {
              context.pop();
              AppOverlays.showErrorDialog(
                  context: context,
                  error:
                      "Your account is a Service Personnel account, You can't login as a Home Resident");
              return;
            }
          }

          _token = response.token;
          _wallet = _user?.wallet;
          _accountType = _user?.accountType;

          if (isUser) {
            ref.watch(cartProvider).viewCart(ref: ref).then((value) {
              context.pop();
              context.goNamed(AppRouter.userDashboard);
            });
          } else {
            context.pop();
            context.goNamed(AppRouter.driverDashboard);
          }
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

  Future<void> topupWallet(
      {required BuildContext context,
      required String reference,
      required WidgetRef ref}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      _repo.topupWallet(reference, ref).then((response) {
        if (response.isSuccessful) {
          context.pop();
          _wallet = response.data.toString();
          notifyListeners();
          AppOverlays.showSuccessDialog(
              context: context,
              content: response.message ?? 'Balance updated successfully');
        } else {
          context.pop();
          AppOverlays.showErrorDialog(
              context: context,
              error: response.message ?? 'An unknown error occurred');
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorDialog(context: context, error: e);
    }
  }

  void updateNotificationCount() async {
    _notificationCount--;
    notifyListeners();
  }

  void updateNotificationCountValue(int count) {
    _notificationCount = count;
  }

  Future<void> updateProfilePhoto(
      {required BuildContext context,
      required File pickedFile,
      required WidgetRef ref}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      final payload = await _getProfilePhotoPaylooad(pickedFile: pickedFile);
      _repo.updateProfilePicture(payload, ref).then((response) {
        if (response.isSuccessful) {
          context.pop();
          _user = UserSchema.fromJson(response.data);
          notifyListeners();
          AppOverlays.showSuccessDialog(
              context: context,
              content:
                  response.message ?? 'Profile Photo Updated successfully');
        } else {
          context.pop();
          AppOverlays.showErrorDialog(
              context: context, error: response.message ?? 'An error occurred');
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorDialog(context: context, error: e);
    }
  }

  Future<void> forgotPassword(
      {required BuildContext context,
      required String phone,
      required WidgetRef ref}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      _repo.forgotPassword(phone, ref).then((response) {
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
    _user == null;
  }

  Map<String, String> _getUserLoginPayload({
    required String phone,
    required String otp,
  }) {
    return {'phone_number': phone, 'otp': otp};
  }

  Future<FormData> _getProfilePhotoPaylooad({required File pickedFile}) async {
    return FormData.fromMap({
      'avatar': [
        await MultipartFile.fromFile(pickedFile.path,
            filename: pickedFile.path.split('/').last)
      ]
    });
  }
}
