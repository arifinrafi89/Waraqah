import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../p2p/p2p_routes.dart';
import 'used_listings_sheet.dart';
import 'used_option_row.dart';

/// "From readers · 3 listings · from ৳300". Opens the listing, where the
/// buyer makes the seller an offer; with several, a sheet lists the sellers
/// first. Readers' copies never go in the cart: the seller accepts or
/// declines, and payment happens between them.
class ReadersRow extends StatelessWidget {
  const ReadersRow({super.key, required this.listings});

  final List<P2pListing> listings;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final cheapest = listings.reduce((a, b) => b.priceBdt < a.priceBdt ? b : a);
    return UsedOptionRow(
      icon: Icons.people_outline_rounded,
      title: l10n.bookFromReaders,
      detail: l10n.bookListingCount(listings.length),
      price: l10n.bookFromPrice(Bdt.format(cheapest.priceBdt)),
      trailing: const Padding(
        padding: EdgeInsets.all(Insets.md),
        child: Icon(Icons.chevron_right_rounded),
      ),
      onTap: () => _open(context),
    );
  }

  Future<void> _open(BuildContext context) async {
    final router = GoRouter.of(context);
    final listing = listings.length == 1
        ? listings.single
        : await showUsedListingsSheet(context, listings);
    if (listing != null) router.push(P2pRoutes.listingDetailFor(listing.id));
  }
}
