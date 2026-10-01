import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../handled_sale/domain/entities/handled_sale.dart';
import '../../../handled_sale/presentation/providers/handled_sale_providers.dart';
import '../providers/moderation_providers.dart';

/// A moderator settling a disputed handled sale. It goes into the log.
extension DisputeSettleActions on WidgetRef {
  Future<void> settleDispute(
    BuildContext context,
    HandledSale sale, {
    required bool refund,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    final l10n = AppL10n.of(context)!;
    try {
      await read(
        saleDisputesProvider.notifier,
      ).settle(sale.id, refund: refund, by: read(sessionProvider)?.name ?? '');
      invalidate(auditLogProvider);
      messenger.showSnackBar(SnackBar(content: Text(l10n.moderationDone)));
    } catch (_) {
      messenger.showSnackBar(
        SnackBar(content: Text(l10n.commonSomethingWentWrong)),
      );
    }
  }
}
