import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class AuthRepository {
  final _api = Api();

  Future<ApiResponse> login(dynamic payload, WidgetRef ref) async {
    final response = _api.postData('/auth/mobile/login',
        data: payload, hasHeader: false, ref: ref);
    print("===========${response}");
    return response;
  }

  Future<ApiResponse> forgotPassword(String phone, WidgetRef ref) async {
    final response = _api.postData('/auth/mobile/password/email',
        data: {
          'phone': phone,
        },
        ref: ref);
    return response;
  }

  Future<ApiResponse> updateProfilePicture(dynamic data, WidgetRef ref) async {
    final response =
        _api.postData('/profile/upload/profile-picture', data: data, ref: ref);
    return response;
  }

  Future<ApiResponse> topupWallet(String reference, WidgetRef ref) async {
    final response = _api.postData('/top-up/using/paystack',
        data: {'ref_id': reference}, ref: ref);
    log(response.toString());

    return response;
  }

  Future<ApiResponse> postFcmToken(String? fcmToken, WidgetRef ref) async {
    final response = _api.postData('/user/add/fcm/token',
        data: {'fcm_token': fcmToken}, ref: ref);
    return response;
  }

  Future<ApiResponse> rateApplication(
      {required dynamic paylaod, required WidgetRef ref}) async {
    final response =
        _api.postData('/application/rate', data: paylaod, ref: ref);
    return response;
  }

  Future<ApiResponse> refreshUser({required WidgetRef ref}) async {
    final response = _api.getData('/user', ref: ref);
    return response;
  }

  Future<ApiResponse> deleteAccount({required WidgetRef ref}) async {
    final response = _api.postData("/user/delete/account", data: '', ref: ref);
    return response;
  }
}
