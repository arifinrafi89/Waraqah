import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../../domain/entities/booklist.dart';
import 'booklist_labels.dart';

/// A Booklist on the Booklists page: title, kind and how many books.
/// Opens the Booklist page.
class BooklistTile extends StatelessWidget {
  const BooklistTile({super.key, required this.booklist});

  final Booklist booklist;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final isBangla = Localizations.localeOf(context).languageCode == 'bn';
    return Padding(
      padding: const EdgeInsets.only(bottom: Insets.sm),
      child: SurfaceCard(
        clip: true,
        child: Material(
          type: MaterialType.transparency,
          child: ListTile(
            leading: Icon(
              Icons.checklist_rounded,
              color: context.palette.accent,
            ),
            title: Text(
              booklist.title(isBangla),
              style: context.texts.titleSmall,
            ),
            subtitle: Text(
              '${booklist.kind.label(l10n)} · '
              '${l10n.sectionBookCount(booklist.books.length)}',
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => context.push(CatalogRoutes.booklistFor(booklist.id)),
          ),
        ),
      ),
    );
  }
}
