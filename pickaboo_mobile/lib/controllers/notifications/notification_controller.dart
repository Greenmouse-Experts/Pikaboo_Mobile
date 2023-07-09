import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/notification_schema.dart';
import '../../widgets/widgets.dart';
import '../auth/auth_controller.dart';
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
      ref
          .read(authProvider.notifier)
          .updateNotificationCountValue(_unreadNotifications.length);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> readNotification(
      {required BuildContext context,
      required int id,
      required WidgetRef ref}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      _repo.readNotification(id.toString(), ref).then((response) {
        context.pop();
        context.pop();
        if (response.isSuccessful) {
          final i = _notifications.indexWhere((element) => element.id == id);
          _notifications.removeAt(i);
          _unreadNotifications = _notifications
              .where((element) => element.status == 'Unread')
              .toList();
          _readNotifications = _notifications
              .where((element) => element.status != 'Unread')
              .toList();
          ref.read(authProvider.notifier).updateNotificationCount();
          notifyListeners();
        } else {
          AppOverlays.showErrorDialog(
              context: context,
              error: response.message ?? 'An unknown error occured');
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorDialog(context: context, error: e.toString());
    }
  }

  Future<void> deleteNotification(
      {required BuildContext context,
      required int id,
      required WidgetRef ref}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      _repo.deleteNotification(id.toString(), ref).then((response) {
        context.pop();
        context.pop();
        if (response.isSuccessful) {
          final i = _notifications.indexWhere((element) => element.id == id);
          _notifications.removeAt(i);
          _unreadNotifications = _notifications
              .where((element) => element.status == 'Unread')
              .toList();
          _readNotifications = _notifications
              .where((element) => element.status != 'Unread')
              .toList();
          ref.read(authProvider.notifier).updateNotificationCount();
          notifyListeners();
          AppOverlays.showSuccessSnackBar(
              context: context,
              message: response.message ?? 'Notification deleted successfully');
        } else {
          AppOverlays.showErrorDialog(
              context: context,
              error: response.message ?? 'An unknown error occured');
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorDialog(context: context, error: e.toString());
    }
  }
}
