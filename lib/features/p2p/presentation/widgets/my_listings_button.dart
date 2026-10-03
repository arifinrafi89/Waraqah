import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../../../l10n/app_localizations.dart';
import '../../p2p_routes.dart';

class MyListingsButton extends ConsumerWidget {
  const MyListingsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(sessionProvider);
    if (user == null) return const SizedBox.shrink();

    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.only(top: Insets.md),
      child: GestureDetector(
        onTap: () => context.push(P2pRoutes.myListings),
        child: SurfaceCard(
          padding: const EdgeInsets.symmetric(
            horizontal: Insets.lg,
            vertical: Insets.md,
          ),
          child: Row(
            children: [
              Icon(Icons.list_alt_rounded, color: palette.accent),
              const SizedBox(width: Insets.md),
              Expanded(
                child: Text(
                  AppL10n.of(context)!.listingMyListings,
                  style: context.texts.titleMedium,
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: palette.textFaint),
            ],
          ),
        ),
      ),
    );
  }
}
