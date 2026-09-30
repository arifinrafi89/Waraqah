import '../../domain/entities/loyalty_rules.dart';
import '../../domain/entities/points_account.dart';
import '../models/points_model.dart';

/// The reader's points on the fake backend, starting with a welcome bonus
/// and the two demo orders. Checkout spends and earns here; cancelling an
/// order undoes both.
class PointsFakeStore {
  PointsFakeStore({DateTime Function()? clock}) : _now = clock ?? DateTime.now {
    final now = _now();
    _entries.addAll([
      PointsEntryModel(
        points: 200,
        reason: PointsReason.welcome,
        at: now.subtract(const Duration(days: 30)),
      ),
      PointsEntryModel(
        points: 12,
        reason: PointsReason.earned,
        at: now.subtract(const Duration(days: 6)),
        orderNumber: 'WQ-100201',
      ),
      PointsEntryModel(
        points: 5,
        reason: PointsReason.earned,
        at: now.subtract(const Duration(hours: 30)),
        orderNumber: 'WQ-100215',
      ),
    ]);
  }

  final DateTime Function() _now;
  final List<PointsEntryModel> _entries = [];

  int get balance => _entries.fold(0, (sum, e) => sum + e.points);

  PointsAccountModel toModel() =>
      PointsAccountModel(balance: balance, entries: _entries.reversed.toList());

  /// Spends up to [wanted] points on an order for [booksBdt] of books and
  /// answers how many were really spent.
  int spend(String orderNumber, int wanted, {required int booksBdt}) {
    final usable = LoyaltyRules.usable(balance: balance, booksBdt: booksBdt);
    final points = wanted.clamp(0, usable);
    if (points > 0) _add(-points, PointsReason.spent, orderNumber);
    return points;
  }

  /// Earns points for [paidBdt] paid for books; answers how many.
  int earn(String orderNumber, int paidBdt) {
    final points = LoyaltyRules.earnedFor(paidBdt);
    if (points > 0) _add(points, PointsReason.earned, orderNumber);
    return points;
  }

  /// A cancelled order gives back what it spent and takes back what it
  /// earned.
  void undo(String orderNumber, {required int spent, required int earned}) {
    if (spent > 0) _add(spent, PointsReason.refunded, orderNumber);
    if (earned > 0) _add(-earned, PointsReason.reversed, orderNumber);
  }

  void _add(int points, PointsReason reason, String orderNumber) =>
      _entries.add(
        PointsEntryModel(
          points: points,
          reason: reason,
          at: _now(),
          orderNumber: orderNumber,
        ),
      );
}
