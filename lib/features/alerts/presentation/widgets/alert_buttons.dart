import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/edition.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_alert.dart';
import '../providers/alert_providers.dart';
import 'alert_actions.dart';

/// For a sold-out Edition: "Notify me", or "We'll let you know" once set,
/// which turns the alert off when tapped again.
class NotifyMeButton extends ConsumerWidget {
  const NotifyMeButton({
    super.key,
    required this.bookId,
    required this.edition,
  });

  final String bookId;
  final Edition edition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final isOn =
        ref.watch(
          editionAlertProvider((
            kind: AlertKind.backInStock,
            editionId: edition.id,
          )),
        ) !=
        null;
    void toggle() => ref.toggleStockAlert(context, bookId, edition);
    return isOn
        ? SecondaryButton(
            label: l10n.alertStockOn,
            icon: const Icon(Icons.notifications_active_outlined, size: 18),
            onPressed: toggle,
          )
        : PrimaryButton(
            label: l10n.alertNotifyMe,
            icon: Icons.notifications_outlined,
            onPressed: toggle,
          );
  }
}

/// A bell for a wishlist book: outlined until a price alert is set, then
/// filled. Opens the price picker either way.
class PriceAlertButton extends ConsumerWidget {
  const PriceAlertButton({
    super.key,
    required this.bookId,
    required this.edition,
  });

  final String bookId;
  final Edition edition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final alert = ref.watch(
      editionAlertProvider((kind: AlertKind.priceDrop, editionId: edition.id)),
    );
    return IconButton(
      tooltip: l10n.alertPriceTitle,
      color: context.palette.accent,
      icon: Icon(
        alert == null
            ? Icons.notifications_none_rounded
            : Icons.notifications_active_rounded,
      ),
      onPressed: () => ref.editPriceAlert(context, bookId, edition),
    );
  }
}
