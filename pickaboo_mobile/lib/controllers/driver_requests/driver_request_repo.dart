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
}
