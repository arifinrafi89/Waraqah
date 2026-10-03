import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/p2p_listing.dart';
import '../../p2p_routes.dart';
import '../providers/p2p_add_listing_notifier.dart';

/// Opens the add-listing form on a draft (Edit) or on a Listing a
/// moderator sent back (Edit and send again).
class ListingEditButton extends ConsumerWidget {
  const ListingEditButton({super.key, required this.listing});

  final P2pListing listing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return TextButton.icon(
      icon: const Icon(Icons.edit_outlined, size: 18),
      label: Text(
        listing.status == P2pListingStatus.draft
            ? l10n.listingEdit
            : l10n.listingEditResend,
      ),
      onPressed: () {
        ref
          ..invalidate(p2pAddListingProvider)
          ..read(p2pAddListingProvider.notifier).edit(listing);
        context.push(P2pRoutes.addListing);
      },
    );
  }
}
