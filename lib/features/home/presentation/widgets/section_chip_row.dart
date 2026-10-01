import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../catalog/catalog_routes.dart';
import '../../../catalog/presentation/widgets/section_style.dart';

/// The 8 Sections as a scrolling chip row, coloured like the Catalog tab's
/// Section grid. Each opens its Section page in the Catalog tab.
class SectionChipRow extends StatelessWidget {
  const SectionChipRow({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.only(top: Insets.lg),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
        child: Row(
          spacing: Insets.sm,
          children: [
            for (final (section, color) in [
              for (final s in Section.values) (s, palette.chipFor(s.index)),
            ])
              ActionChip(
                avatar: Icon(section.icon, color: color, size: 18),
                label: Text(section.label(l10n)),
                side: BorderSide(color: color.withValues(alpha: 0.5)),
                onPressed: () => context.go(CatalogRoutes.sectionFor(section)),
              ),
          ],
        ),
      ),
    );
  }
}
