import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/screen_app_bar.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../book_request/presentation/providers/book_request_providers.dart';
import '../../../book_request/presentation/widgets/wanted_section.dart';
import '../../../finished_it/presentation/widgets/finished_books_card.dart';
import '../../../orders/presentation/providers/order_providers.dart';
import '../providers/p2p_providers.dart';
import '../widgets/p2p_my_listing_card.dart';

class P2pMyListingsPage extends ConsumerWidget {
  const P2pMyListingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listingsAsync = ref.watch(myListingsProvider);
    // Load who wants these books, and what the reader bought, alongside
    // them, not after.
    ref
      ..watch(wantedBooksProvider)
      ..watch(myOrdersProvider);
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
                  // Readers looking for these books come first.
                  itemCount: listings.length + 1,
                  separatorBuilder: (_, i) =>
                      SizedBox(height: i == 0 ? 0 : Insets.md),
                  itemBuilder: (context, index) => index == 0
                      ? const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [FinishedBooksCard(), WantedSection()],
                        )
                      : P2pMyListingCard(listing: listings[index - 1]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
