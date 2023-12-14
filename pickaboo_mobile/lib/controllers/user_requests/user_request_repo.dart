import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class UserRequestRepoo {
  final _api = Api();

  Future<ApiResponse> getScheduledRequests({required WidgetRef ref}) {
    final response =
        _api.getData("/home-residence/schedule-request/get", ref: ref);
    return response;
    //check to verify it's not hardcoded as N5000
  }
}
