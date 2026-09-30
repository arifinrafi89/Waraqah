import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/cart_item_ref.dart';
import '../../domain/entities/smart_basket.dart';
import '../providers/cart_providers.dart';

extension SmartBasketActions on WidgetRef {
  /// Replaces each new book in [swaps] with its used copy, then says how
  /// much was saved.
  Future<void> applySwaps(BuildContext context, List<UsedSwap> swaps) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final cart = read(cartProvider.notifier);
    var saved = 0;
    try {
      for (final swap in swaps) {
        final used = swap.isCertified
            ? CartItemRef.certifiedUsed(swap.copy.id)
            : CartItemRef.listing(swap.copy.id);
        if (await cart.add(used)) {
          await cart.remove(swap.line.id);
          saved += swap.savingBdt;
        }
      }
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
      return;
    }
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(l10n.cartSwapped(Bdt.format(saved)))),
      );
  }
}
