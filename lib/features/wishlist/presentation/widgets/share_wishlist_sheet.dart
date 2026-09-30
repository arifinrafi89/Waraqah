import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/shared_wishlist.dart';
import '../../wishlist_routes.dart';
import '../providers/shared_wishlist_providers.dart';

/// Turns on the reader's wishlist link and shows it, with Copy link and a
/// way to see the list the way friends will.
Future<void> showShareWishlistSheet(BuildContext context) =>
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      builder: (_) => const _ShareSheet(),
    );

class _ShareSheet extends ConsumerWidget {
  const _ShareSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          Insets.screen,
          0,
          Insets.screen,
          Insets.lg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: Insets.md,
          children: [
            Text(l10n.wishlistShareTitle, style: context.texts.titleMedium),
            Text(
              l10n.wishlistShareBody,
              style: AppFonts.ui(size: 12.5, color: context.palette.textDim),
            ),
            AsyncView(
              value: ref.watch(myWishlistLinkProvider),
              errorLabel: l10n.commonSomethingWentWrong,
              retryLabel: l10n.commonRetry,
              onRetry: () => ref.invalidate(myWishlistLinkProvider),
              skeleton: const ShimmerBox(
                height: Sizes.fieldHeight * 2,
                radius: Radii.md,
              ),
              builder: (list) => _Link(list: list),
            ),
          ],
        ),
      ),
    );
  }
}

class _Link extends StatelessWidget {
  const _Link({required this.list});

  final SharedWishlist list;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final link = WishlistRoutes.linkFor(list.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: palette.surface,
            border: Border.all(color: palette.border),
            borderRadius: BorderRadius.circular(Radii.md),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Insets.md),
            child: SelectableText(
              link,
              style: AppFonts.ui(size: 12.5, color: palette.text),
            ),
          ),
        ),
        PrimaryButton(
          label: l10n.wishlistCopyLink,
          icon: Icons.link_rounded,
          onPressed: () async {
            final messenger = ScaffoldMessenger.of(context);
            Navigator.pop(context);
            await Clipboard.setData(ClipboardData(text: link));
            messenger
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(l10n.wishlistLinkCopied)));
          },
        ),
        SecondaryButton(
          label: l10n.wishlistPreview,
          onPressed: () {
            final router = GoRouter.of(context);
            Navigator.pop(context);
            router.push(WishlistRoutes.sharedFor(list.id));
          },
        ),
      ],
    );
  }
}
