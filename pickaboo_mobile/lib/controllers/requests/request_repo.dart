import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class RequestRepository {
  final _api = Api();

  Future<ApiResponse> getDriverRequests({required WidgetRef ref}) async {
    final response = _api
        .getData('/service-personnel/view/assigned/schedule/request', ref: ref);
    return response;
  }

  Future<ApiResponse> viewCleanUpResidence(
      {required String id, required WidgetRef ref}) async {
    final response = _api.getData(
        '/service-personnel/view/cleanup/residence?cleanup_id?$id',
        ref: ref);
    return response;
  }

  Future<ApiResponse> viewResidenceDetails(
      {required String id, required WidgetRef ref}) async {
    final response = _api.getData(
        '/service-personnel/view/residence/user/details?residence_user_id=$id',
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
}
