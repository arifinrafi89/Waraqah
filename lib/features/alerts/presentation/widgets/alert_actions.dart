import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/edition.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/book_alert.dart';
import '../providers/alert_providers.dart';
import 'price_alert_sheet.dart';

/// Turning alerts on and off from any page. Guests are sent to log in.
extension AlertActions on WidgetRef {
  Future<void> toggleStockAlert(
    BuildContext context,
    String bookId,
    Edition edition,
  ) async {
    if (!_signedIn(context)) return;
    final l10n = AppL10n.of(context)!;
    final existing = read(
      editionAlertProvider((
        kind: AlertKind.backInStock,
        editionId: edition.id,
      )),
    );
    await _change(
      context,
      () => existing == null
          ? read(alertsProvider.notifier).set(
              AlertRequest.backInStock(bookId: bookId, editionId: edition.id),
            )
          : read(alertsProvider.notifier).remove(existing.id),
      existing == null ? l10n.alertStockSet : l10n.alertTurnedOff,
    );
  }

  Future<void> editPriceAlert(
    BuildContext context,
    String bookId,
    Edition edition,
  ) async {
    if (!_signedIn(context)) return;
    final l10n = AppL10n.of(context)!;
    final existing = read(
      editionAlertProvider((kind: AlertKind.priceDrop, editionId: edition.id)),
    );
    final choice = await showPriceAlertSheet(
      context,
      currentBdt: edition.priceBdt,
      targetBdt: existing?.targetPriceBdt,
    );
    if (choice == null || !context.mounted) return;
    final notifier = read(alertsProvider.notifier);
    await _change(
      context,
      () => choice == PriceAlertChoice.off
          ? notifier.remove(existing!.id)
          : notifier.set(
              AlertRequest.priceDrop(
                bookId: bookId,
                editionId: edition.id,
                targetPriceBdt: choice,
              ),
            ),
      choice == PriceAlertChoice.off ? l10n.alertTurnedOff : l10n.alertPriceSet,
    );
  }

  bool _signedIn(BuildContext context) {
    if (read(sessionProvider) != null) return true;
    context.push(AuthRoutes.login);
    return false;
  }

  Future<void> _change(
    BuildContext context,
    Future<void> Function() change,
    String done,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final error = AppL10n.of(context)!.commonSomethingWentWrong;
    var message = done;
    try {
      await change();
    } catch (_) {
      message = error;
    }
    messenger
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
