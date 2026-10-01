import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/presentation/widgets/edition_labels.dart';
import '../../domain/entities/low_stock_edition.dart';
import '../providers/catalog_admin_actions.dart';
import 'stock_dialog.dart';

/// One low Edition: cover, title, format and language, and a stock badge
/// that opens [showStockDialog].
class LowStockRow extends ConsumerWidget {
  const LowStockRow({super.key, required this.edition});

  final LowStockEdition edition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    final out = edition.stock == 0;
    return SurfaceCard(
      padding: const EdgeInsets.all(10),
      child: Row(
        spacing: Insets.md,
        children: [
          SizedBox(
            width: Sizes.listThumbWidth,
            child: CoverArt(
              title: edition.title,
              seed: edition.coverSeed,
              aspectRatio: Sizes.listThumbWidth / Sizes.listThumbHeight,
              fontSize: 8.5,
              radius: 10,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  edition.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.texts.titleSmall,
                ),
                Text(
                  '${l10n.formatLabel(edition.format)} · '
                  '${l10n.languageLabel(edition.language)}',
                  style: context.texts.bodySmall,
                ),
              ],
            ),
          ),
          ActionChip(
            tooltip: l10n.adminCatalogSetStock,
            backgroundColor: out ? palette.danger : palette.accentSoft,
            labelStyle: context.texts.labelMedium?.copyWith(
              color: out ? palette.bg : palette.text,
            ),
            label: Text(
              out
                  ? l10n.stockOutOfStock
                  : l10n.adminCatalogStockLeft(edition.stock),
            ),
            onPressed: () async {
              final stock = await showStockDialog(context, edition.stock);
              if (stock == null) return;
              await ref
                  .read(catalogAdminActionsProvider)
                  .setStock(edition.editionId, stock);
            },
          ),
        ],
      ),
    );
  }
}
