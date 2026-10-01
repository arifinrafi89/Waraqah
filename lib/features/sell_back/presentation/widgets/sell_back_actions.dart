import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../wallet/presentation/providers/wallet_providers.dart';
import '../../domain/entities/sell_back.dart';
import '../../sell_back_routes.dart';
import '../providers/sell_back_providers.dart';

/// Accepting a quote, and staff grading what was picked up.
extension SellBackActions on WidgetRef {
  Future<void> acceptQuote(BuildContext context, SellBackDraft draft) async {
    final router = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppL10n.of(context)!;
    try {
      await read(createSellBackProvider).call(draft);
      invalidate(mySellBacksProvider);
      router.pushReplacement(SellBackRoutes.mine);
      messenger.showSnackBar(SnackBar(content: Text(l10n.sellBackBooked)));
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }

  Future<void> gradeTradeIn(
    BuildContext context,
    SellBack sellBack,
    BookCondition condition, {
    required bool accept,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppL10n.of(context)!;
    try {
      await read(tradeInQueueProvider.notifier)
          .grade(sellBack.id, condition, accept: accept);
      invalidate(walletProvider);
      messenger.showSnackBar(
        SnackBar(
          content: Text(accept ? l10n.sellBackGraded : l10n.sellBackReturned),
        ),
      );
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }
}
