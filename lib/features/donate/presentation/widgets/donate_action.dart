import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../orders/orders_routes.dart';
import '../../../orders/presentation/providers/order_providers.dart';
import '../../domain/entities/donation.dart';
import '../providers/donate_providers.dart';

extension DonateAction on WidgetRef {
  /// Places the donation, then thanks the donor with a way to track it.
  /// Answers whether it went through.
  Future<bool> donate(
    BuildContext context,
    DonationRequest request, {
    required String recipientName,
  }) async {
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final router = GoRouter.of(context);
    try {
      final donation = await read(donateBookProvider).call(request);
      invalidate(recipientProvider(request.recipientId));
      invalidate(recipientsProvider);
      invalidate(myOrdersProvider);
      messenger
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(l10n.giftDonateThanks(recipientName)),
            action: SnackBarAction(
              label: l10n.orderTrack,
              onPressed: () =>
                  router.push(OrdersRoutes.detailsFor(donation.orderNumber)),
            ),
            // Goes by itself, like any other message.
            persist: false,
          ),
        );
      return true;
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
      return false;
    }
  }
}
