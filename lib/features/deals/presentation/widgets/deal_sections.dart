import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/deals.dart';
import 'bundle_card.dart';
import 'countdown.dart';
import 'deal_item_tile.dart';

/// The Deals page's content: the flash sale with its countdown, bundles,
/// then books to pre-order. Sections with nothing in them are left out.
class DealSections extends StatelessWidget {
  const DealSections({super.key, required this.deals});

  final Deals deals;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final sale = deals.flashSale;
    final date = DateFormat.yMMMd(
      Localizations.localeOf(context).toLanguageTag(),
    );
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        if (sale != null) ...[
          Row(
            children: [
              Expanded(child: SectionHeader(title: l10n.dealFlashSale)),
              Countdown(
                endsAt: sale.endsAt,
                style: AppFonts.numeric(size: 15, color: palette.accent),
              ),
            ],
          ),
          for (final item in sale.items)
            DealItemTile(
              item: item,
              detail: l10n.cartYouSave(
                Bdt.format(item.regularPriceBdt - item.priceBdt),
              ),
            ),
        ],
        if (deals.bundles.isNotEmpty) ...[
          SectionHeader(title: l10n.dealBundles),
          for (final bundle in deals.bundles)
            Padding(
              padding: const EdgeInsets.only(bottom: Insets.md),
              child: BundleCard(bundle: bundle),
            ),
        ],
        if (deals.preorders.isNotEmpty) ...[
          SectionHeader(title: l10n.dealPreorders),
          for (final p in deals.preorders)
            DealItemTile(
              item: p.item,
              detail: l10n.dealReleases(date.format(p.releaseDate)),
            ),
        ],
      ],
    );
  }
}
