import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../p2p_routes.dart';
import '../providers/p2p_providers.dart';
import 'seller_labels.dart';

/// Who's selling, where, and how they're rated, on a listing. Opens their
/// seller page.
class SellerRow extends ConsumerWidget {
  const SellerRow({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final seller = ref.watch(sellerProvider(listing.sellerId)).value;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: InkWell(
        onTap: () => context.push(P2pRoutes.sellerFor(listing.sellerId)),
        borderRadius: BorderRadius.circular(Radii.sm),
        child: Row(
          spacing: Insets.md,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: palette.accentSoft,
              child: Text(
                listing.sellerName.characters.first,
                style: AppFonts.ui(
                  size: 14,
                  weight: FontWeight.w800,
                  color: palette.accent,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 2,
                children: [
                  Text(
                    l10n.usedSoldBy(listing.sellerName, listing.place),
                    style: context.texts.titleSmall,
                  ),
                  Text(
                    seller == null
                        ? l10n.sellerSeeProfile
                        : '${l10n.ratingLine(seller)} · '
                              '${l10n.sellerBooksSold(seller.booksSold)}',
                    style: AppFonts.ui(size: 11.5, color: palette.textDim),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: palette.textFaint),
          ],
        ),
      ),
    );
  }
}
