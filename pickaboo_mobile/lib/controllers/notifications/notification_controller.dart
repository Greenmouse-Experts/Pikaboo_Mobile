import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/notification_schema.dart';
import 'notification_repo.dart';

final notificationProvider =
    ChangeNotifierProvider<NotificationNotifier>((ref) {
  return NotificationNotifier();
});

class NotificationNotifier extends ChangeNotifier {
  final _repo = NotificationRepository();

  List<NotificationSchema> _notifications = [];
  List<NotificationSchema> get notifications => _notifications;

  List<NotificationSchema> _unreadNotifications = [];
  List<NotificationSchema> get unreadNotifications => _unreadNotifications;

  List<NotificationSchema> _readNotifications = [];
  List<NotificationSchema> get readNotifications => _readNotifications;

  Future<void> getAllNotifications({required WidgetRef ref}) async {
    try {
      final response = await _repo.getAllNotifications(ref);
      if (response.isSuccessful) {
        _notifications = NotificationSchema.getList(response.data);
        _unreadNotifications = _notifications
            .where((element) => element.status == 'Unread')
            .toList();
        _readNotifications = _notifications
            .where((element) => element.status != 'Unread')
            .toList();
      }
    } catch (e) {
      rethrow;
    }
  }
}
