import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/p2p_providers.dart';
import '../widgets/p2p_my_listing_card.dart';

class P2pMyListingsPage extends ConsumerWidget {
  const P2pMyListingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingsAsync = ref.watch(myListingsProvider);
    final l10n = AppL10n.of(context)!;
    
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            ScreenAppBar(title: l10n.listingMyListings),
            Expanded(
              child: AsyncView(
                value: listingsAsync,
                onRetry: () => ref.invalidate(myListingsProvider),
                skeleton: const Center(child: CircularProgressIndicator()),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                builder: (listings) => ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    Insets.screen,
                    Insets.md,
                    Insets.screen,
                    Sizes.navClearance,
                  ),
                  itemCount: listings.length,
                  separatorBuilder: (_, _) => const SizedBox(height: Insets.md),
                  itemBuilder: (context, index) =>
                      P2pMyListingCard(listing: listings[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
