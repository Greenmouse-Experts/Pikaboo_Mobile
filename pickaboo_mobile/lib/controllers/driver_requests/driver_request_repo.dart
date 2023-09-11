import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class DriverRequestRepo {
  final _api = Api();

  Future<ApiResponse> getScheduledRequest({required WidgetRef ref}) async {
    final response = _api
        .getData('/service-personnel/view/assigned/schedule/request', ref: ref);
    return response;
  }

  Future<ApiResponse> getScheduledResidence(
      {required WidgetRef ref, required String id}) async {
    final response = _api.getData(
        '/service-personnel/view/schedule/residence?cleanup_id=$id',
        ref: ref);
    return response;
  }

  Future<ApiResponse> completeCleanUp(
      {required dynamic payload, required WidgetRef ref}) async {
    final response = _api.postData(
        '/service-personnel/complete/schedule/residence',
        data: payload,
        ref: ref);
    return response;
  }

  Future<ApiResponse> getSpecialRequest({required WidgetRef ref}) async {
    final response =
        _api.getData("/service-personnel/special-requests/get", ref: ref);
    return response;
  }

  Future<ApiResponse> getSpecialResidence(
      {required WidgetRef ref, required String id}) async {
    final response = _api.getData(
        "/service-personnel/special-requests/view/residence?special_request_id=$id",
        ref: ref);
    return response;
  }

  Future<ApiResponse> completeSpecialRequest(
      {required dynamic payload, required WidgetRef ref}) async {
    final response = _api.postData(
        "/service-personnel/special-requests/complete/request",
        data: payload,
        ref: ref);
    return response;
  }
}
