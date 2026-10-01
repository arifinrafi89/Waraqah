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
import '../providers/shared_wishlist_providers.dart';
import '../widgets/shared_wishlist_list.dart';
import '../widgets/wishlist_skeleton.dart';

/// `/wishlist/shared/:id`: someone's wishlist from the link they sent.
/// Anyone can open it, signed in or not, and buy a book from it.
class SharedWishlistPage extends ConsumerWidget {
  const SharedWishlistPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final shared = ref.watch(sharedWishlistProvider(id));
    final list = shared.value;
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
                          list == null
                              ? l10n.wishlistTitle
                              : l10n.wishlistSharedTitle(list.ownerName),
                          style: context.texts.titleLarge,
                        ),
                        if (list != null)
                          Text(
                            l10n.wishlistCount(list.books.length),
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
                value: shared,
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(sharedWishlistProvider(id)),
                skeleton: const WishlistSkeleton(),
                builder: (list) => list == null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(Insets.xl),
                          child: Text(
                            l10n.wishlistSharedMissing,
                            textAlign: TextAlign.center,
                            style: AppFonts.ui(
                              size: 13,
                              color: palette.textDim,
                            ),
                          ),
                        ),
                      )
                    : SharedWishlistList(list: list),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
