import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../data/models/driver_schedule_schema.dart';
import '../../data/models/driver_special_request_schema.dart';
import '../../data/models/models.dart';
import '../../widgets/widgets.dart';
import 'driver_request_repo.dart';

final driverScheduledResidenceProvider = FutureProvider.autoDispose
    .family<List<DriverScheduleResidenceSchema>, String>((ref, id) async {
  final response =
      await ref.watch(driverRequestProvider).getScheduledResidence(id: id);
  return response;
});

final driverScheduledRequestProvider = FutureProvider((
  ref,
) async {
  await Future.delayed(
    Duration(seconds: 6),
  );
  final response =
      await ref.watch(driverRequestProvider).getScheduledRequests();
  print("rUNNING DRIVERSCHEDULEPROVIDER");
  return response;
});

final driverRequestProvider =
    ChangeNotifierProvider<DriverRequestNotifier>((ref) {
  return DriverRequestNotifier(ref);
});

class DriverRequestNotifier extends ChangeNotifier {
  final _repo = DriverRequestRepo();

  List<DriverScheduleSchema> _driverSchedulesHome = [];
  final Ref ref;
  DriverRequestNotifier(this.ref);
  List<DriverScheduleSchema> get driverSchedulesHome => _driverSchedulesHome;

  List<DriverSpecialSchema> _driverSpecialRequests = [];
  List<DriverSpecialSchema> get driverSpecialRequests => _driverSpecialRequests;

  set driverSpecialRequests(List<DriverSpecialSchema> value) {
    _driverSpecialRequests = value;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  set driverSchedulesHome(List<DriverScheduleSchema> value) {
    _driverSchedulesHome = value;
    notifyListeners();
  }

  Future<List<DriverScheduleSchema>> getScheduledRequests() async {
    try {
      final response = await _repo.getScheduledRequest(ref: ref);
      if (response.isSuccessful) {
        _driverSchedulesHome = DriverScheduleSchema.getList(response.data);
        return _driverSchedulesHome;
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<List<DriverScheduleResidenceSchema>> getScheduledResidence(
      {required String id}) async {
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
      bool isSpecial = false,
      required BuildContext context,
      required String cleanupId,
      required String residenceId}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      if (isSpecial) {
        _repo.completeSpecialRequest(payload: {
          "special_request_id": cleanupId,
        }, ref: ref).then((response) {
          context.pop();
          if (response.isSuccessful) {
            AppOverlays.showSuccessDialog(
                context: context,
                content: response.message ?? "Request Completed successfully",
                onPressed: () {
                  context.pop();
                });
          } else {
            AppOverlays.showErrorDialog(
                context: context,
                error: response.message ?? "Unknown error occured");
          }
        });
        return;
      }
      _repo.completeCleanUp(payload: {
        "cleanup_request_id": cleanupId,
        "residence_id": residenceId
      }, ref: ref).then((response) {
        context.pop();
        if (response.isSuccessful) {
          ref.invalidate(driverScheduledResidenceProvider);
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

  Future<void> getSpecialRequests({required WidgetRef ref}) async {
    try {
      final response = await _repo.getSpecialRequest(ref: ref);
      //print(response);
      if (response.isSuccessful) {
        _driverSpecialRequests = DriverSpecialSchema.getList(response.data);
        //  _driverSpecialRequests = [..._driverSpecialRequests, ...newRequest];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> completeSpecialRequest({
    required WidgetRef ref,
    required BuildContext context,
    required String cleanupId,
  }) async {
    AppOverlays.loadingDialog(context: context);
    try {
      _repo.completeSpecialRequest(payload: {
        "special_request_id": cleanupId,
      }, ref: ref).then((response) {
        context.pop();
        if (response.isSuccessful) {
          AppOverlays.showSuccessDialog(
              context: context,
              content: response.message ?? "Request Completed successfully",
              onPressed: () {
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
