import 'dart:io';

import 'package:dio/dio.dart';
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

  String? _token;
  String? get token => _token;

  Future<void> homeOwnerLogin(
      {required BuildContext context,
      required String phone,
      required String otp,
      required WidgetRef ref}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      final payload = _getUserLoginPayload(phone: phone, otp: otp);
      _repo.login(payload, ref).then((response) {
        if (response.isSuccessful) {
          _token = response.token;
          _homeOwner = HomeOwnerSchema.fromJson(response.data);
          context.pop();
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
          _homeOwner = HomeOwnerSchema.fromJson(response.data);
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
    _homeOwner == null;
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
