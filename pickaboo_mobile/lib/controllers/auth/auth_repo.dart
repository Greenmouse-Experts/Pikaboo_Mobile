import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class AuthRepository {
  final _api = Api();

  Future<ApiResponse> login(dynamic payload) async {
    final response =
        _api.postData('/auth/mobile/login', data: payload, hasHeader: false);
    return response;
  }

  Future<ApiResponse> forgotPassword(String phone) async {
    final response =
        _api.postData('/auth/mobile/password/email', data: {'phone': phone});
    return response;
  }

  Future<ApiResponse> updateProfilePicture(dynamic data) async {
    final response =
        _api.postData('/profile/upload/profile-picture', data: data);
    return response;
  }
}
