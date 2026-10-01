import 'dart:math';

import '../../domain/entities/wallet.dart';
import '../models/wallet_model.dart';

/// The reader's wallet on the fake backend, starting with one Sell Back
/// credit so it isn't empty. Checkout spends from it; cancelled paid
/// orders and approved returns pay back into it. Sell Back (Arifin) will
/// call [credit].
class WalletFakeStore {
  WalletFakeStore({DateTime Function()? clock}) : _now = clock ?? DateTime.now {
    _entries.add(
      WalletEntryModel(
        amountBdt: 180,
        reason: WalletReason.sellBack,
        at: _now().subtract(const Duration(days: 12)),
        note: 'Zero to One',
      ),
    );
  }

  final DateTime Function() _now;
  final List<WalletEntryModel> _entries = [];

  int get balance => _entries.fold(0, (sum, e) => sum + e.amountBdt);

  WalletModel toModel() =>
      WalletModel(balanceBdt: balance, entries: _entries.reversed.toList());

  /// Spends up to [wanted] taka on an order; answers how much really was.
  int spend(String orderNumber, int wanted) {
    final amount = min(max(wanted, 0), balance);
    if (amount > 0) _add(-amount, WalletReason.spent, orderNumber: orderNumber);
    return amount;
  }

  /// Money in: a refund for an order, or a Sell Back with a [note].
  void credit(
    int amountBdt,
    WalletReason reason, {
    String? orderNumber,
    String? note,
  }) {
    if (amountBdt > 0) {
      _add(amountBdt, reason, orderNumber: orderNumber, note: note);
    }
  }

  void _add(
    int amount,
    WalletReason reason, {
    String? orderNumber,
    String? note,
  }) => _entries.add(
    WalletEntryModel(
      amountBdt: amount,
      reason: reason,
      at: _now(),
      orderNumber: orderNumber,
      note: note,
    ),
  );
}
