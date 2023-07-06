import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class NotificationRepository {
  final _api = Api();

  Future<ApiResponse> getAllNotifications(WidgetRef ref) async {
    final response = _api.getData('/user/get/all/notifications', ref: ref);
    return response;
  }

  Future<ApiResponse> readNotification(String id, WidgetRef ref) async {
    final response = _api.postData('/user/read/notification',
        data: {'notification_id': id}, ref: ref);
    return response;
  }
}
