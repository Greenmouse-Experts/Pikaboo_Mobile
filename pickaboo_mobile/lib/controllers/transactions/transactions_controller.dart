import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/models.dart';
import 'transactions_repo.dart';

final transactionsProvider = ChangeNotifierProvider<TranactionNotifier>((ref) {
  return TranactionNotifier();
});

class TranactionNotifier extends ChangeNotifier {
  final _repo = TransactionsRepo();

  List<TransactionSchema> _transactions = [];
  List<TransactionSchema> get transactions => _transactions;

  Future<void> getTransactionHistory({required WidgetRef ref}) async {
    try {
      final response = await _repo.getTransactionHistory(ref: ref);
      if (response.isSuccessful) {
        _transactions = TransactionSchema.getList(response.data);
      }
    } catch (e) {
      rethrow;
    }
  }
}
