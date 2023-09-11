import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../cart/cart_controller.dart';
import '../notifications/notification_controller.dart';
import 'auth_repo.dart';

final authProvider = ChangeNotifierProvider<_AuthNotifier>((ref) {
  return _AuthNotifier();
});

class _AuthNotifier extends ChangeNotifier {
  final _repo = AuthRepository();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  UserSchema? _user;
  UserSchema? get user => _user;

  bool _isFirstTimeUser = true;
  bool get isFirstTimeUser => _isFirstTimeUser;

  String? _token;
  String? get token => _token;

  String? _wallet;
  String? get wallet => _wallet;

  int _notificationCount = 0;
  int get notificationCount => _notificationCount;

  String? _accountType;
  String? get accountType => _accountType;

  bool _isRefreshing = false;
  bool get isRefreshing => _isRefreshing;

  Future<void> restoreUserSession(WidgetRef ref) async {
    final pref = await _prefs;
    final userData = pref.getString('user');
    final res = pref.getBool('isFirstTimeUser');
    if (res != null) {
      _isFirstTimeUser = res;
    }
    if (userData != null) {
      _user = UserSchema.fromRawJson(userData);
      _notificationCount = _user?.notificationsCount ?? 0;
      _token = pref.getString('token');
      _wallet = _user?.wallet?.toString() ?? '0';
      _accountType = _user?.accountType;
      notifyListeners();
    }
    await refreshUser(ref: ref);
    ref.watch(notificationProvider).getAllNotifications(ref: ref);
  }

  Future<void> setFirstTimeUser() async {
    final pref = await _prefs;
    pref.setBool('isFirstTimeUser', false);
  }

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
          _wallet = _user?.wallet?.toString() ?? '0';
          _accountType = _user?.accountType;

          _prefs.then((pref) {
            pref.setString('user', _user?.toRawJson() ?? '');
            pref.setString('token', _token ?? '');
            final messaging = FirebaseMessaging.instance;
            messaging
                .requestPermission(
              alert: true,
              badge: true,
              provisional: false,
              sound: true,
            )
                .then((settings) {
              if (settings.authorizationStatus ==
                  AuthorizationStatus.authorized) {
                FirebaseMessaging.instance.getToken().then((token) {
                  _repo.postFcmToken(token, ref);
                });
              }
            });

            if (isUser) {
              ref.watch(cartProvider).viewCart(ref: ref).then((value) {
                context.pop();
                context.goNamed(AppRouter.userDashboard);
              });
            } else {
              context.pop();
              context.goNamed(AppRouter.driverDashboard);
            }
          });
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

  // Future<void> _setUser(String user) async {
  //   final pref = await _prefs;
  //   pref.setString('user', user);
  // }

  Future<void> setFcmToken() async {}

  Future<void> updateUser(dynamic data) async {
    _user = UserSchema.fromJson(data);
    _wallet = _user?.wallet?.toString() ?? '0';
    _notificationCount = _user?.notificationsCount ?? 0;
    final pref = await _prefs;
    pref.setString('user', _user?.toRawJson() ?? '');
    notifyListeners();
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
          refreshUser(ref: ref);
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
          updateUser(response.data);
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

  Future<void> deleteAccount(
      {required WidgetRef ref, required BuildContext context}) async {
    AppOverlays.loadingDialog(context: context);

    try {
      _repo.deleteAccount(ref: ref).then((response) {
        context.pop();
        if (response.isSuccessful) {
          logout(context: context);
        } else {
          AppOverlays.showErrorDialog(
              context: context,
              error: response.message ?? "An unknown error occured");
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorDialog(context: context, error: e);
    }
  }

  Future<void> rateApplication(
      {required BuildContext context,
      required String rating,
      required String improvement,
      required WidgetRef ref}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      final payload =
          _getRatingPayload(rating: rating, improvement: improvement);
      _repo.rateApplication(paylaod: payload, ref: ref).then((response) {
        context.pop();
        if (response.isSuccessful) {
          context.pushReplacementNamed(AppRouter.feedbackStatus);
        } else {
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

  void logout({required BuildContext context}) async {
    _prefs.then((pref) {
      pref.remove('user');
      pref.remove('token');
      context.goNamed(AppRouter.dashboard);
      _user == null;
    });
  }

  Future<void> refreshUser({required WidgetRef ref}) async {
    try {
      //   final userId = _user?.id.toString() ?? '';
      _isRefreshing = true;

      notifyListeners();
      await _repo.refreshUser(ref: ref).then((response) {
        if (response.isSuccessful) {
          _user = UserSchema.fromJson(response.data);
          updateUser(response.data);
        }

        _isRefreshing = false;
        notifyListeners();
      });
      //await updateUser(_user);
    } catch (e) {
      rethrow;
    }
  }

  Map<String, String> _getUserLoginPayload({
    required String phone,
    required String otp,
  }) {
    return {'phone_number': phone, 'otp': otp};
  }

  Map<String, String> _getRatingPayload(
      {required String rating, required String improvement}) {
    return {'rating': rating, "improvement": improvement};
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
