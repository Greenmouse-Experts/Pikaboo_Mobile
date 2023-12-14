import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/user_request_schema.dart';
import 'user_request_repo.dart';

final userRequestProvider = ChangeNotifierProvider<UserRequestNotifier>((ref) {
  return UserRequestNotifier();
});

class UserRequestNotifier extends ChangeNotifier {
  final _repo = UserRequestRepoo();

  List<UserRequestSchema> _userRequests = [];
  List<UserRequestSchema> get userRequests => _userRequests;

  Future<void> getSscheduledRequests({required WidgetRef ref}) async {
    try {
      print("Start debugging");
      final response = await _repo.getScheduledRequests(ref: ref);
      print("Start testing");
      if (response.isSuccessful) {
        print("Start success");
        _userRequests = UserRequestSchema.getList(response.data);
        print("Start ${_userRequests.map((e) => e.price)}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
