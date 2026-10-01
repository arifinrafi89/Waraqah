import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../donate_routes.dart';
import '../providers/donate_providers.dart';
import '../widgets/donate_header.dart';
import '../widgets/donate_skeleton.dart';
import '../widgets/recipient_summary.dart';

/// `/donate`: verified places that take books, each with how far along
/// they are. Tap one to see the books it needs.
class DonatePage extends ConsumerWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            DonateHeader(title: l10n.giftDonateTitle),
            Expanded(
              child: AsyncView(
                value: ref.watch(recipientsProvider),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(recipientsProvider),
                skeleton: const DonateSkeleton(),
                builder: (recipients) => ListView(
                  padding: const EdgeInsets.fromLTRB(
                    Insets.screen,
                    0,
                    Insets.screen,
                    Insets.xl,
                  ),
                  children: [
                    Text(
                      l10n.giftDonateIntro,
                      style: AppFonts.ui(size: 12.5, color: palette.textDim),
                    ),
                    for (final recipient in recipients)
                      Padding(
                        padding: const EdgeInsets.only(top: Insets.md),
                        child: SurfaceCard(
                          padding: const EdgeInsets.all(Insets.md),
                          child: InkWell(
                            onTap: () => context.push(
                              DonateRoutes.recipientFor(recipient.id),
                            ),
                            child: RecipientSummary(recipient: recipient),
                          ),
                        ),
                      ),
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
