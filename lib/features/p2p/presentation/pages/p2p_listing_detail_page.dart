import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../inbox/presentation/widgets/listing_offer_bar.dart';
import '../../../report/domain/entities/content_report.dart';
import '../../../report/presentation/providers/report_providers.dart';
import '../../../report/presentation/widgets/blocked_seller_bar.dart';
import '../../../report/presentation/widgets/report_menu_button.dart';
import '../../p2p_routes.dart';
import '../providers/p2p_providers.dart';
import '../widgets/listing_details.dart';
import '../widgets/listing_details_skeleton.dart';

/// `/p2p/listing/:id`: one used copy. Buyers make an offer or message the
/// seller from the bar at the bottom; on the reader's own listing, every
/// buyer's conversation is listed instead.
class P2pListingDetailPage extends ConsumerWidget {
  const P2pListingDetailPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final listing = ref.watch(p2pListingDetailProvider(id));
    final loaded = listing.value;
    final theirs = loaded == null || loaded.isMine ? null : loaded;
    final blocked =
        theirs != null && ref.watch(isBlockedProvider(theirs.sellerId));
    return Scaffold(
      bottomNavigationBar: theirs == null
          ? null
          : blocked
          ? BlockedSellerBar(readerId: theirs.sellerId, name: theirs.sellerName)
          : ListingOfferBar(listing: theirs),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
              child: Row(
                spacing: Insets.md,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(P2pRoutes.p2p),
                  ),
                  Text(l10n.usedListingTitle, style: context.texts.titleLarge),
                  if (theirs != null) ...[
                    const Spacer(),
                    ReportMenuButton(
                      target: ReportTarget(
                        kind: ReportTargetKind.listing,
                        id: theirs.id,
                      ),
                      readerId: theirs.sellerId,
                      readerName: theirs.sellerName,
                    ),
                  ],
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: listing,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(p2pListingDetailProvider(id)),
                skeleton: const ListingDetailsSkeleton(),
                builder: (listing) => listing == null
                    ? Center(child: Text(l10n.usedListingMissing))
                    : ListingDetails(listing: listing),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
