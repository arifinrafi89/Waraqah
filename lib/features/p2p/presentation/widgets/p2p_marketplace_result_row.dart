import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';
import '../providers/p2p_filter_providers.dart';

/// How many Listings match, and the Sort menu: newest first, or by price.
class P2pMarketplaceResultRow extends ConsumerWidget {
  const P2pMarketplaceResultRow({super.key, required this.listings});

  final List<P2pListing> listings;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final sort = ref.watch(p2pSortProvider);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.md,
        Insets.screen,
        0,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              l10n.bookListingCount(listings.length),
              style: Theme.of(context).textTheme.labelMedium
                  ?.copyWith(color: context.palette.textFaint),
            ),
          ),
          PopupMenuButton<P2pSort>(
            initialValue: sort,
            tooltip: l10n.usedSort,
            onSelected: ref.read(p2pSortProvider.notifier).select,
            itemBuilder: (_) => [
              for (final (value, label) in [
                (P2pSort.newest, l10n.usedSortNewest),
                (P2pSort.priceLow, l10n.usedSortPriceLow),
                (P2pSort.priceHigh, l10n.usedSortPriceHigh),
              ])
                PopupMenuItem(value: value, child: Text(label)),
            ],
            child: Padding(
              padding: const EdgeInsets.all(Insets.sm),
              child: Row(
                spacing: Insets.xs,
                children: [
                  Icon(
                    Icons.sort_rounded,
                    size: 17,
                    color: context.palette.accent,
                  ),
                  Text(
                    l10n.usedSort,
                    style: TextStyle(color: context.palette.accent),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
