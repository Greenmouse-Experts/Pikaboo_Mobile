import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class SpecialRequestRepo {
  final _api = Api();

  Future<ApiResponse> createRequest(
      {required dynamic payload, required WidgetRef ref}) async {
    final response = _api.postData('/home-residence/special-request/create',
        data: payload, ref: ref);
    return response;
  }

  Future<ApiResponse> getFlatRate({required WidgetRef ref}) async {
    final response = _api.getData('/get/flat/rate', ref: ref);
    return response;
  }

  Future<ApiResponse> getSpecialRequestHistory({required WidgetRef ref}) async {
    final response =
        _api.getData('/home-residence/special-request/get', ref: ref);
    return response;
  }
}
