import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../wishlist_routes.dart';

/// "My wishlist" row for Profile: drop in `const WishlistLink()`. It doesn't
/// load the wishlist itself, so Profile opens without an extra request.
class WishlistLink extends StatelessWidget {
  const WishlistLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: SecondaryButton(
        label: AppL10n.of(context)!.wishlistMine,
        icon: const Icon(Icons.favorite_border_rounded, size: 18),
        onPressed: () => context.push(WishlistRoutes.wishlist),
      ),
    );
  }
}
