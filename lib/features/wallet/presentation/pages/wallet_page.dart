import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/profile_routes.dart';
import '../providers/wallet_providers.dart';
import '../widgets/wallet_entry_tile.dart';

/// `/wallet`: taka the reader holds with Waraqah, where it comes from, and
/// its history.
class WalletPage extends ConsumerWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
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
                        : context.go(ProfileRoutes.profile),
                  ),
                  Text(l10n.walletTitle, style: context.texts.titleLarge),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: ref.watch(walletProvider),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(walletProvider),
                skeleton: const Padding(
                  padding: EdgeInsets.all(Insets.screen),
                  child: ShimmerBox(height: 200, radius: Radii.card),
                ),
                builder: (wallet) => ListView(
                  padding: const EdgeInsets.fromLTRB(
                    Insets.screen,
                    0,
                    Insets.screen,
                    Insets.xl,
                  ),
                  children: [
                    SurfaceCard(
                      padding: const EdgeInsets.all(Insets.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: Insets.sm,
                        children: [
                          Text(
                            Bdt.format(wallet.balanceBdt),
                            style: AppFonts.numeric(
                              size: 26,
                              color: palette.accent,
                            ),
                          ),
                          for (final rule in [
                            l10n.walletRuleIn,
                            l10n.walletRuleSpend,
                          ])
                            Text(
                              '· $rule',
                              style: AppFonts.ui(
                                size: 12.5,
                                color: palette.textDim,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SectionHeader(title: l10n.walletHistory),
                    for (final entry in wallet.entries)
                      WalletEntryTile(entry: entry),
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
