import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../checkout/domain/entities/payment_method.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../domain/entities/handled_sale.dart';
import '../../domain/repositories/handled_sale_repository.dart';
import '../../handled_sale_routes.dart';
import '../providers/handled_sale_providers.dart';
import 'dispute_sheet.dart';

/// Buying through Waraqah and moving a sale on, with a message each time.
extension SaleActions on WidgetRef {
  Future<void> buyListing(
    BuildContext context,
    String listingId,
    PaymentMethod method,
  ) => _run(context, () async {
    final sale = await read(buyListingProvider)
        .call((listingId: listingId, method: method));
    if (context.mounted) {
      context.pushReplacement(HandledSaleRoutes.saleFor(sale.id));
    }
  });

  Future<void> stepSale(
    BuildContext context,
    HandledSale sale,
    SaleStep step,
  ) => _run(
    context,
    () => read(stepSaleProvider).call((id: sale.id, step: step)),
  );

  Future<void> disputeSale(BuildContext context, HandledSale sale) async {
    final draft = await showDisputeSheet(context, sale.id);
    if (draft == null || !context.mounted) return;
    final sent = AppL10n.of(context)!.usedDisputeSent;
    await _run(context, () => read(openDisputeProvider).call(draft), sent);
  }

  Future<void> requestPayout(BuildContext context) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    try {
      final before = await read(earningsProvider.future);
      await read(requestPayoutProvider).call(const NoParams());
      invalidate(earningsProvider);
      final amount = Bdt.format(before.earnedBdt - before.paidOutBdt);
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.usedEarningsPaid(amount))),
      );
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }

  /// Runs [action], then reloads every view of sales and Listings.
  Future<void> _run(
    BuildContext context,
    Future<void> Function() action, [
    String? done,
  ]) async {
    final messenger = ScaffoldMessenger.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    try {
      await action();
      invalidate(saleProvider);
      invalidate(mySalesProvider);
      invalidate(earningsProvider);
      invalidate(p2pListingsProvider);
      invalidate(myListingsProvider);
      invalidate(p2pListingDetailProvider);
      if (done != null) messenger.showSnackBar(SnackBar(content: Text(done)));
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(error)));
    }
  }
}
