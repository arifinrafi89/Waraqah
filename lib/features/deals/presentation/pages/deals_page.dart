import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../home/home_routes.dart';
import '../providers/deals_providers.dart';
import '../widgets/deal_sections.dart';

/// `/deals`: the flash sale with its countdown, bundles, and books to
/// pre-order.
class DealsPage extends ConsumerWidget {
  const DealsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
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
                  Text(l10n.dealTitle, style: context.texts.titleLarge),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: ref.watch(dealsProvider),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(dealsProvider),
                skeleton: const Padding(
                  padding: EdgeInsets.all(Insets.screen),
                  child: ShimmerBox(height: 320, radius: Radii.card),
                ),
                builder: (deals) => DealSections(deals: deals),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
