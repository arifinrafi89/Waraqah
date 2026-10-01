import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';
import '../../domain/entities/book_alert.dart';
import '../providers/alert_providers.dart';

/// One alert: the book, what it's waiting for or that it happened, and a
/// button to turn it off. Tapping it opens the book.
class AlertTile extends ConsumerWidget {
  const AlertTile({super.key, required this.alert});

  final BookAlert alert;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final now = Bdt.format(alert.currentPriceBdt);
    final target = Bdt.format(alert.targetPriceBdt ?? 0);
    final status = switch ((alert.kind, alert.isTriggered)) {
      (AlertKind.backInStock, true) => l10n.alertBackNow,
      (AlertKind.backInStock, false) => l10n.alertWaitingStock,
      (AlertKind.priceDrop, true) => l10n.alertPriceDropped(now),
      (AlertKind.priceDrop, false) => l10n.alertWaitingPrice(target, now),
    };
    return SurfaceCard(
      clip: true,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () => context.push(CatalogRoutes.bookDetailFor(alert.bookId)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              Insets.md,
              Insets.md,
              4,
              Insets.md,
            ),
            child: Row(
              spacing: Insets.md,
              children: [
                Icon(
                  alert.kind == AlertKind.backInStock
                      ? Icons.inventory_2_outlined
                      : Icons.sell_outlined,
                  color: alert.isTriggered ? palette.accent : palette.textFaint,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(alert.bookTitle, style: context.texts.titleSmall),
                      Text(
                        status,
                        style: AppFonts.ui(
                          size: 12,
                          weight: alert.isTriggered
                              ? FontWeight.w800
                              : FontWeight.w600,
                          color: alert.isTriggered
                              ? palette.accent
                              : palette.textDim,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: l10n.alertTurnOff,
                  icon: const Icon(Icons.close_rounded, size: 18),
                  color: palette.textDim,
                  onPressed: () =>
                      ref.read(alertsProvider.notifier).remove(alert.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
