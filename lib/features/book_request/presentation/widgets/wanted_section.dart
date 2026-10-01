import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../p2p/p2p_routes.dart';
import '../providers/book_request_providers.dart';

/// "Readers want your books": other readers' requests for books the
/// reader is selling. Nothing when there are none (or while loading).
class WantedSection extends ConsumerWidget {
  const WantedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final wanted = ref.watch(wantedBooksProvider).value ?? const [];
    if (wanted.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: Insets.sm,
      children: [
        SectionHeader(title: l10n.requestWantedTitle),
        for (final w in wanted)
          SurfaceCard(
            padding: const EdgeInsets.all(Insets.md),
            child: Row(
              spacing: Insets.md,
              children: [
                Icon(Icons.campaign_outlined, color: palette.accent),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 2,
                    children: [
                      Text(
                        l10n.requestWantedLine(w.readerName, w.title),
                        style: AppFonts.ui(size: 13, color: palette.text),
                      ),
                      if (w.maxPriceBdt case final price?)
                        Text(
                          l10n.requestUnder(Bdt.format(price)),
                          style: AppFonts.ui(size: 12, color: palette.textDim),
                        ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () =>
                      context.push(P2pRoutes.listingDetailFor(w.listingId)),
                  child: Text(l10n.requestOpenListing),
                ),
              ],
            ),
          ),
        const SizedBox(height: Insets.md),
      ],
    );
  }
}
