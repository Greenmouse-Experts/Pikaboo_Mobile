import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import 'request_repo.dart';

final requestProvider = ChangeNotifierProvider<RequestNotifier>((ref) {
  return RequestNotifier();
});

class RequestNotifier extends ChangeNotifier {
  final _repo = RequestRepository();

  List<CleanUpSchema> _cleanUpRequests = [];
  List<CleanUpSchema> get cleanUpRequests => _cleanUpRequests;

  Future<void> getAllRequests({required WidgetRef ref}) async {
    try {
      final response = await _repo.getDriverRequests(ref: ref);

      if (response.isSuccessful) {
        _cleanUpRequests = CleanUpSchema.getList(response.data);
      }
    } catch (e) {
      rethrow;
    }
  }
}
