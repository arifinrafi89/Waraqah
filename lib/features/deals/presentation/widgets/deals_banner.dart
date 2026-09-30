import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../deals_routes.dart';
import '../providers/deals_providers.dart';
import 'countdown.dart';

/// A strip for Home while a flash sale is on: "Flash sale ends in 05:12:09
/// · See deals". Nothing at all when there's no sale.
class DealsBanner extends ConsumerWidget {
  const DealsBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sale = ref.watch(dealsProvider).value?.flashSale;
    if (sale == null) return const SizedBox.shrink();
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final ink = AppFonts.ui(
      size: 12.5,
      weight: FontWeight.w800,
      color: palette.accentInk,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        Insets.screen,
        0,
        Insets.screen,
        Insets.lg,
      ),
      child: Material(
        color: palette.accent,
        borderRadius: BorderRadius.circular(Radii.md),
        child: InkWell(
          onTap: () => context.push(DealsRoutes.deals),
          borderRadius: BorderRadius.circular(Radii.md),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Insets.md,
              vertical: 10,
            ),
            child: Row(
              spacing: Insets.sm,
              children: [
                Icon(Icons.bolt_rounded, color: palette.accentInk),
                Flexible(child: Text(l10n.dealFlashEndsIn, style: ink)),
                Countdown(endsAt: sale.endsAt, style: ink),
                const Spacer(),
                Text(l10n.dealSeeAll, style: ink),
                Icon(Icons.chevron_right_rounded, color: palette.accentInk),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
