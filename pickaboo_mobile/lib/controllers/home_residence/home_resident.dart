import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pickaboo_mobile/data/models/driver_schedule_residence_schema.dart';
// import 'package:pickaboo_mobile/data/models/driver_special_request_schema.dart';

final homeResidenseProvider = Provider<Residence>((ref) {
  final data = {
    "user_id": "user_id",
  };

  return Residence.fromJson(data);
});
