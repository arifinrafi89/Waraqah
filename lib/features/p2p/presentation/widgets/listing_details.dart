import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/used_labels.dart';
import '../../../handled_sale/presentation/widgets/handled_sale_card.dart';
import '../../../inbox/presentation/widgets/listing_conversations.dart';
import '../../domain/entities/p2p_listing.dart';
import 'listing_facts.dart';
import 'p2p_marketplace_cover.dart';
import 'seller_row.dart';

/// Everything about one used copy: cover, title, who's selling and where,
/// condition and price, and the seller's note. On the reader's own
/// listing, the buyers' conversations follow.
class ListingDetails extends StatelessWidget {
  const ListingDetails({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final save = listing.saveAmount;
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.xl,
      ),
      children: [
        Center(
          child: SizedBox(
            width: 150,
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: P2pMarketplaceCover(listing: listing),
            ),
          ),
        ),
        const SizedBox(height: Insets.lg),
        Text(listing.title, style: context.texts.titleLarge),
        if (listing.isMine) ...[
          const SizedBox(height: 4),
          Text(
            l10n.usedYourListing,
            style: AppFonts.ui(size: 13, color: palette.textDim),
          ),
        ],
        const SizedBox(height: Insets.md),
        Row(
          spacing: Insets.md,
          children: [
            Text(
              Bdt.format(listing.priceBdt),
              style: AppFonts.numeric(size: 24, color: palette.accent),
            ),
            if (save != null)
              Text(
                l10n.usedSaveVsNew(Bdt.format(save)),
                style: AppFonts.ui(size: 12, color: palette.textDim),
              ),
          ],
        ),
        const SizedBox(height: Insets.md),
        ListingFacts(listing: listing),
        if (!listing.isMine && listing.isAvailable) ...[
          const SizedBox(height: Insets.lg),
          HandledSaleCard(listingId: listing.id, priceBdt: listing.priceBdt),
        ],
        if (!listing.isMine) ...[
          const SizedBox(height: Insets.lg),
          SellerRow(listing: listing),
        ],
        if (listing.note case final note?) ...[
          const SizedBox(height: Insets.lg),
          SectionHeader(title: l10n.usedSellerNote),
          Text(
            note,
            style: AppFonts.ui(size: 13, height: 1.5, color: palette.text),
          ),
        ],
        if (listing.isMine) ListingConversations(listingId: listing.id),
        if (!listing.isMine)
          Padding(
            padding: const EdgeInsets.only(top: Insets.lg),
            child: Text(
              l10n.usedConditionAndSafety(
                l10n.conditionLabel(listing.condition),
              ),
              style: AppFonts.ui(size: 11.5, color: palette.textFaint),
            ),
          ),
      ],
    );
  }
}
