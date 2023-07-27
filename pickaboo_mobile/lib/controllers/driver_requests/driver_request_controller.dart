import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/driver_schedule_schema.dart';
import '../../data/models/models.dart';
import 'driver_request_repo.dart';

final driverRequestProvider =
    ChangeNotifierProvider<DriverRequestNotifier>((ref) {
  return DriverRequestNotifier();
});

class DriverRequestNotifier extends ChangeNotifier {
  final _repo = DriverRequestRepo();

  List<DriverScheduleSchema> _driverSchedulesHome = [];
  List<DriverScheduleSchema> get driverSchedulesHome => _driverSchedulesHome;

  Future<void> getScheduledRequests({required WidgetRef ref}) async {
    try {
      final response = await _repo.getScheduledRequest(ref: ref);
      if (response.isSuccessful) {
        _driverSchedulesHome = DriverScheduleSchema.getList(response.data);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DriverScheduleResidenceSchema>> getScheduledResidence(
      {required WidgetRef ref, required String id}) async {
    try {
      final response = await _repo.getScheduledResidence(ref: ref, id: id);
      // if (response.isSuccessful) {
      return DriverScheduleResidenceSchema.getList(response.data);
      // }
    } catch (e) {
      rethrow;
    }
  }
}
