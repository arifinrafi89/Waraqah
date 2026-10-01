import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';
import 'p2p_labels.dart';

/// The price, and an Available / Reserved pill beside it (or under it on a
/// narrow tile).
class P2pMarketplacePriceBlock extends StatelessWidget {
  const P2pMarketplacePriceBlock({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final statusColor = listing.isAvailable
        ? palette.accent
        : palette.textFaint;
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 4,
      children: [
        Text(
          Bdt.format(listing.priceBdt),
          style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(color: palette.accent),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusColor.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            AppL10n.of(context)!.marketStatus(listing.status),
            style: Theme.of(context).textTheme.labelSmall
                ?.copyWith(color: statusColor, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }
}
