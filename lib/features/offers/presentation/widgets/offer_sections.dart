import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/offers.dart';
import 'bundle_card.dart';
import 'countdown.dart';
import 'offer_item_tile.dart';

/// The Offers page's content: the flash sale with its countdown, bundles,
/// then books to pre-order. Sections with nothing in them are left out.
class OfferSections extends StatelessWidget {
  const OfferSections({super.key, required this.offers});

  final Offers offers;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final sale = offers.flashSale;
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
              Expanded(child: SectionHeader(title: l10n.offerFlashSale)),
              Countdown(
                endsAt: sale.endsAt,
                style: AppFonts.numeric(size: 15, color: palette.accent),
              ),
            ],
          ),
          for (final item in sale.items)
            OfferItemTile(
              item: item,
              detail: l10n.cartYouSave(
                Bdt.format(item.regularPriceBdt - item.priceBdt),
              ),
            ),
        ],
        if (offers.bundles.isNotEmpty) ...[
          SectionHeader(title: l10n.offerBundles),
          for (final bundle in offers.bundles)
            Padding(
              padding: const EdgeInsets.only(bottom: Insets.md),
              child: BundleCard(bundle: bundle),
            ),
        ],
        if (offers.preorders.isNotEmpty) ...[
          SectionHeader(title: l10n.offerPreorders),
          for (final p in offers.preorders)
            OfferItemTile(
              item: p.item,
              detail: l10n.offerReleases(date.format(p.releaseDate)),
            ),
        ],
      ],
    );
  }
}
