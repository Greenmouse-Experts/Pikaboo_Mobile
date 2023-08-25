import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/driver_schedule_schema.dart';
import '../../data/models/models.dart';
import '../../widgets/widgets.dart';
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

      return DriverScheduleResidenceSchema.getList(response.data);
      // }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> completeCleanUp(
      {required WidgetRef ref,
      required BuildContext context,
      required String cleanupId,
      required String residenceId}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      _repo.completeCleanUp(payload: {
        "cleanup_request_id": cleanupId,
        "residence_id": residenceId
      }, ref: ref).then((response) {
        context.pop();
        if (response.isSuccessful) {
          AppOverlays.showSuccessDialog(
              context: context,
              content: response.message ?? "Home scanned successfully",
              onPressed: () {
                context.pop();
                context.pop();
                context.pop();
              });
        } else {
          AppOverlays.showErrorDialog(
              context: context,
              error: response.message ?? "Unknown error occured");
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorDialog(context: context, error: e.toString());
    }
  }
}
