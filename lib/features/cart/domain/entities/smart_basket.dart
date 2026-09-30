import '../../../../core/models/edition.dart';
import '../../../catalog/domain/entities/used_options.dart';
import 'cart.dart';
import 'cart_line.dart';

/// Swapping one new book in the cart for a cheaper used copy of it.
class UsedSwap {
  const UsedSwap({required this.line, required this.copy});

  final CartLine line;
  final UsedCopy copy;

  /// A Certified Used copy has no seller; a reader's listing does.
  bool get isCertified => copy.sellerName == null;

  int get savingBdt => line.totalBdt - copy.priceBdt;
}

/// The cheapest mix that fits a budget: which swaps to make and the total.
class BudgetPlan {
  const BudgetPlan({
    required this.swaps,
    required this.totalBdt,
    required this.fits,
  });

  final List<UsedSwap> swaps;
  final int totalBdt;
  final bool fits;
}

/// Ways to pay less for what's in the cart:
/// - a printed new book (one copy) that's available used for less
/// - how much more to add for free delivery
class SmartBasket {
  const SmartBasket({
    required this.subtotalBdt,
    required this.swaps,
    this.toFreeDeliveryBdt,
  });

  /// [used] maps book ids to their used copies; [freeDeliveryFromBdt] is
  /// checkout's free-delivery threshold.
  factory SmartBasket.of(
    Cart cart,
    Map<String, UsedOptions> used, {
    required int freeDeliveryFromBdt,
  }) {
    final swaps = <UsedSwap>[
      for (final line in cart.lines)
        if (line.kind == CartItemKind.edition &&
            line.format != BookFormat.ebook &&
            line.quantity == 1)
          if (_cheapest(used[line.bookId]) case final copy?)
            if (copy.priceBdt < line.totalBdt) UsedSwap(line: line, copy: copy),
    ]..sort((a, b) => b.savingBdt.compareTo(a.savingBdt));
    final printed = cart.lines.any((l) => l.format != BookFormat.ebook);
    final short = freeDeliveryFromBdt - cart.subtotalBdt;
    return SmartBasket(
      subtotalBdt: cart.subtotalBdt,
      swaps: swaps,
      toFreeDeliveryBdt: printed && short > 0 ? short : null,
    );
  }

  final int subtotalBdt;

  /// Biggest saving first.
  final List<UsedSwap> swaps;

  /// `null` once delivery is free, or when nothing needs delivering.
  final int? toFreeDeliveryBdt;

  int get usedSavingsBdt => swaps.fold(0, (sum, s) => sum + s.savingBdt);

  bool get isEmpty => swaps.isEmpty && toFreeDeliveryBdt == null;

  /// Swaps the biggest savings first until the cart fits [budgetBdt]. If
  /// even every swap isn't enough, answers them all with `fits` false.
  BudgetPlan planFor(int budgetBdt) {
    var total = subtotalBdt;
    final chosen = <UsedSwap>[];
    for (final swap in swaps) {
      if (total <= budgetBdt) break;
      chosen.add(swap);
      total -= swap.savingBdt;
    }
    return BudgetPlan(swaps: chosen, totalBdt: total, fits: total <= budgetBdt);
  }

  static UsedCopy? _cheapest(UsedOptions? options) {
    if (options == null) return null;
    final copies = [?options.certifiedUsed, ...options.listings];
    if (copies.isEmpty) return null;
    return copies.reduce((a, b) => b.priceBdt < a.priceBdt ? b : a);
  }
}
