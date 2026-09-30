import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/donate_providers.dart';
import '../widgets/donate_header.dart';
import '../widgets/donate_skeleton.dart';
import '../widgets/need_tile.dart';
import '../widgets/recipient_summary.dart';

/// `/donate/recipient/:id`: one verified place, who it serves, and each
/// book it asked for with a Donate button.
class RecipientPage extends ConsumerWidget {
  const RecipientPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final dim = AppFonts.ui(size: 12.5, color: palette.textDim);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            DonateHeader(title: l10n.giftDonateTitle),
            Expanded(
              child: AsyncView(
                value: ref.watch(recipientProvider(id)),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(recipientProvider(id)),
                skeleton: const DonateSkeleton(),
                builder: (recipient) => recipient == null
                    ? Center(child: Text(l10n.giftDonateMissing, style: dim))
                    : ListView(
                        padding: const EdgeInsets.fromLTRB(
                          Insets.screen,
                          0,
                          Insets.screen,
                          Insets.xl,
                        ),
                        children: [
                          SurfaceCard(
                            padding: const EdgeInsets.all(Insets.md),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: Insets.md,
                              children: [
                                RecipientSummary(recipient: recipient),
                                Text(recipient.story, style: dim),
                              ],
                            ),
                          ),
                          const SizedBox(height: Insets.lg),
                          Text(
                            l10n.giftDonateNeeds,
                            style: context.texts.titleSmall,
                          ),
                          for (final need in recipient.needs)
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: NeedTile(
                                key: ValueKey(need.book.id),
                                recipient: recipient,
                                need: need,
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
