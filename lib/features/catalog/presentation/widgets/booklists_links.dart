import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';

/// The Catalog tab's way into Booklists, under the Section grid.
class BooklistsCard extends StatelessWidget {
  const BooklistsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return SurfaceCard(
      clip: true,
      child: Material(
        type: MaterialType.transparency,
        child: ListTile(
          leading: Icon(Icons.checklist_rounded, color: context.palette.accent),
          title: Text(l10n.booklistTitle, style: context.texts.titleSmall),
          subtitle: Text(l10n.booklistEntrySub),
          trailing: const Icon(Icons.chevron_right_rounded),
          onTap: () => context.push(CatalogRoutes.booklists),
        ),
      ),
    );
  }
}

/// "My booklists" row for Profile: drop in `const MyBooklistsLink()`.
class MyBooklistsLink extends StatelessWidget {
  const MyBooklistsLink({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: Insets.md),
    child: SecondaryButton(
      label: AppL10n.of(context)!.booklistProfileLink,
      icon: const Icon(Icons.checklist_rounded, size: 18),
      onPressed: () => context.push(CatalogRoutes.booklists),
    ),
  );
}
