import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../p2p_routes.dart';
import '../providers/p2p_providers.dart';
import '../widgets/listing_details_skeleton.dart';
import '../widgets/seller_listings.dart';
import '../widgets/seller_reviews.dart';
import '../widgets/seller_summary.dart';

/// `/p2p/seller/:id`: a reader as others see them. Name, area, member
/// since, books sold and rating; what the people they dealt with said;
/// and what they're selling now.
class SellerPage extends ConsumerWidget {
  const SellerPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final seller = ref.watch(sellerProvider(id));
    return Scaffold(
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
                  Text(l10n.sellerTitle, style: context.texts.titleLarge),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: seller,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(sellerProvider(id)),
                skeleton: const ListingDetailsSkeleton(),
                builder: (seller) => seller == null
                    ? Center(child: Text(l10n.sellerMissing))
                    : ListView(
                        padding: const EdgeInsets.fromLTRB(
                          Insets.screen,
                          0,
                          Insets.screen,
                          Insets.xl,
                        ),
                        children: [
                          SellerSummary(seller: seller),
                          const SizedBox(height: Insets.lg),
                          SellerListings(listings: seller.listings),
                          const SizedBox(height: Insets.lg),
                          SellerReviews(reviews: seller.reviews),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
