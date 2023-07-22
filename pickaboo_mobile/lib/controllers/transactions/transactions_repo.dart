import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/api/api.dart';
import '../../data/api/api_response.dart';

class TransactionsRepo {
  final _api = Api();

  Future<ApiResponse> getTransactionHistory({required WidgetRef ref}) async {
    final response = _api.getData('/get/transaction/histories', ref: ref);
    return response;
  }
}
