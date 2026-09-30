import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/offers_providers.dart';
import 'countdown.dart';

/// Under the editions on a book's page: the flash-sale countdown if the
/// chosen Edition is in the sale, and the release date if it's a
/// pre-order. Nothing otherwise.
class EditionOfferNotes extends ConsumerWidget {
  const EditionOfferNotes({super.key, required this.editionId});

  final String editionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final flash = ref.watch(flashItemProvider(editionId));
    final sale = ref.watch(offersProvider).value?.flashSale;
    final preorder = ref.watch(preorderProvider(editionId));
    if ((flash == null || sale == null) && preorder == null) {
      return const SizedBox.shrink();
    }
    final text = AppFonts.ui(
      size: 12.5,
      weight: FontWeight.w700,
      color: palette.text,
    );
    return Padding(
      padding: const EdgeInsets.only(top: Insets.sm),
      child: SurfaceCard(
        padding: const EdgeInsets.all(Insets.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: Insets.sm,
          children: [
            if (flash != null && sale != null)
              Row(
                spacing: Insets.sm,
                children: [
                  Icon(Icons.bolt_rounded, color: palette.accent, size: 20),
                  Flexible(child: Text(l10n.offerFlashEndsIn, style: text)),
                  Countdown(
                    endsAt: sale.endsAt,
                    style: AppFonts.numeric(size: 13, color: palette.accent),
                  ),
                ],
              ),
            if (preorder != null)
              Row(
                spacing: Insets.sm,
                children: [
                  Icon(Icons.event_outlined, color: palette.accent, size: 20),
                  Expanded(
                    child: Text(
                      l10n.offerReleases(
                        DateFormat.yMMMd(
                          Localizations.localeOf(context).toLanguageTag(),
                        ).format(preorder.releaseDate),
                      ),
                      style: text,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
