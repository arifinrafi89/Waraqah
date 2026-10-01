import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/content_width.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/domain/entities/p2p_listing.dart';
import '../../../p2p/presentation/providers/p2p_providers.dart';
import '../../../p2p/presentation/widgets/listing_details_skeleton.dart';
import '../widgets/buy_form.dart';
import '../widgets/sale_app_bar.dart';

/// `/sales/buy/:listingId`: what the reader pays, how, and that Waraqah
/// holds it until they confirm the book.
class BuyPage extends ConsumerWidget {
  const BuyPage({super.key, required this.listingId});

  final String listingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: ContentWidth(
          child: Column(
            children: [
              SaleAppBar(title: l10n.usedBuyTitle),
              Expanded(
                child: AsyncView(
                  value: ref.watch(p2pListingDetailProvider(listingId)),
                  errorLabel: l10n.commonSomethingWentWrong,
                  retryLabel: l10n.commonRetry,
                  onRetry: () =>
                      ref.invalidate(p2pListingDetailProvider(listingId)),
                  skeleton: const ListingDetailsSkeleton(),
                  builder: (listing) =>
                      listing == null || !listing.isAvailable || listing.isMine
                      ? Padding(
                          padding: const EdgeInsets.all(Insets.xl),
                          child: Text(l10n.usedBuyUnavailable),
                        )
                      : BuyForm(listing: listing),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
