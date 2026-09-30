import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../cart/presentation/widgets/cart_button.dart';
import '../../../home/home_routes.dart';
import '../providers/wishlist_providers.dart';
import '../widgets/wishlist_empty_view.dart';
import '../widgets/wishlist_skeleton.dart';
import '../widgets/wishlist_tile.dart';

/// `/wishlist`: books the reader saved for later, newest first. Each one can
/// go to the cart from here. Opened over the shell, like the cart.
class WishlistPage extends ConsumerWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final wishlist = ref.watch(wishlistProvider);
    final count = wishlist.value?.length ?? 0;
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
                        : context.go(HomeRoutes.home),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.wishlistTitle,
                          style: context.texts.titleLarge,
                        ),
                        if (count > 0)
                          Text(
                            l10n.wishlistCount(count),
                            style: AppFonts.ui(
                              size: 11,
                              weight: FontWeight.w700,
                              color: palette.textFaint,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const CartButton(),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: wishlist,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(wishlistProvider),
                skeleton: const WishlistSkeleton(),
                builder: (books) => books.isEmpty
                    ? const WishlistEmptyView()
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          Insets.screen,
                          0,
                          Insets.screen,
                          Insets.xl,
                        ),
                        itemCount: books.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (_, i) => WishlistTile(
                          key: ValueKey(books[i].id),
                          book: books[i],
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
