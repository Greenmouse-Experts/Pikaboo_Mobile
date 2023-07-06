import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class AuthRepository {
  final _api = Api();

  Future<ApiResponse> login(dynamic payload, WidgetRef ref) async {
    final response = _api.postData('/auth/mobile/login',
        data: payload, hasHeader: false, ref: ref);
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
    return response;
  }
}
