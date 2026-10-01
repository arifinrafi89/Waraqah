import 'package:flutter/material.dart';

import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../inbox/presentation/widgets/inbox_button.dart';
import '../../domain/entities/p2p_listing.dart';

/// The marketplace title and count, with the inbox (and its live badge of
/// new offers and messages) on the right.
class P2pMarketplaceHeader extends StatelessWidget {
  const P2pMarketplaceHeader({super.key, required this.listings});

  final List<P2pListing> listings;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return ScreenAppBar(
      title: l10n.usedMarketTitle,
      subtitle: l10n.bookListingCount(listings.length),
      actions: const [InboxButton()],
    );
  }
}
