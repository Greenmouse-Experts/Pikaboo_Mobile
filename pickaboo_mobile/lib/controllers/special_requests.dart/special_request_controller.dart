import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/models.dart';
import '../../utilities/utilities.dart';
import '../../widgets/widgets.dart';
import '../auth/auth_controller.dart';
import 'special_request_repo.dart';

final specialProvider = ChangeNotifierProvider<SpecialRequestNotifier>((ref) {
  return SpecialRequestNotifier();
});

class SpecialRequestNotifier extends ChangeNotifier {
  final _repo = SpecialRequestRepo();

  String? _charges;
  String get charges => _charges ?? '0';

  List<SpecialRequestSchema> _specialRequests = [];
  List<SpecialRequestSchema> get specialRequests => _specialRequests;

  Future<void> createSpecialRequest(
      {required BuildContext context,
      required WidgetRef ref,
      required String date,
      String? altAddress}) async {
    AppOverlays.loadingDialog(context: context);
    try {
      final payload = _getCreatePayload(date: date, altAddress: altAddress);
      _repo.createRequest(payload: payload, ref: ref).then((response) {
        if (response.isSuccessful) {
          ref
              .read(authProvider.notifier)
              .updateUser(response.data)
              .then((value) {
            context.pop();
            AppOverlays.showSuccessDialog(
                context: context,
                onPressed: () {
                  context.pop();
                  context.pop();
                  context.pushNamed(AppRouter.userRequests);
                },
                content: response.message ??
                    'Special pick up has been requested successfully');
          });
        } else {
          context.pop();
          AppOverlays.showErrorDialog(
              context: context,
              error: response.message ?? 'An unknown error occurred');
        }
      });
    } catch (e) {
      context.pop();
      AppOverlays.showErrorDialog(context: context, error: e);
    }
  }

  Future<void> getFlatRate(WidgetRef ref) async {
    try {
      final response = await _repo.getFlatRate(ref: ref);

      if (response.isSuccessful) {
        final flatrate = FlatRateSchema.fromJson(response.data);
        _charges = flatrate.charges;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> getSpecialRequestHistory(WidgetRef ref) async {
    try {
      final response = await _repo.getSpecialRequestHistory(ref: ref);

      if (response.isSuccessful) {
        _specialRequests = SpecialRequestSchema.getList(response.data);
      }

      //   ((response) {
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> _getCreatePayload(
      {required String date, String? altAddress}) {
    return {"schedule_date": date, "alt_address": altAddress};
  }
}
