import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../profile/profile_routes.dart';
import '../providers/alert_providers.dart';
import '../widgets/alert_tile.dart';

/// `/alerts`: back-in-stock and price-drop alerts, the ones that happened
/// first. Signed-in only.
class AlertsPage extends ConsumerWidget {
  const AlertsPage({super.key});

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
                  Text(l10n.alertMine, style: context.texts.titleLarge),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: ref.watch(alertsProvider),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(alertsProvider),
                skeleton: const Padding(
                  padding: EdgeInsets.all(Insets.screen),
                  child: ShimmerBox(height: 140, radius: Radii.card),
                ),
                builder: (alerts) => alerts.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(Insets.xl),
                          child: Text(
                            l10n.alertEmpty,
                            textAlign: TextAlign.center,
                            style: AppFonts.ui(
                              size: 13,
                              color: palette.textDim,
                            ),
                          ),
                        ),
                      )
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          Insets.screen,
                          0,
                          Insets.screen,
                          Insets.xl,
                        ),
                        itemCount: alerts.length,
                        separatorBuilder: (_, _) => const SizedBox(height: 10),
                        itemBuilder: (_, i) => AlertTile(
                          key: ValueKey(alerts[i].id),
                          alert: alerts[i],
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
