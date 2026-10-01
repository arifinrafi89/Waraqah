import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';

/// The no-results message for `query`, with a Request this book button.
class SearchNoResults extends StatelessWidget {
  const SearchNoResults({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.screen),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Insets.md,
          children: [
            Text(
              l10n.searchNoResults(query),
              textAlign: TextAlign.center,
              style: context.texts.bodyMedium,
            ),
            PrimaryButton(
              label: l10n.searchRequestBook,
              onPressed: () => context.push(CatalogRoutes.requestBook),
            ),
          ],
        ),
      ),
    );
  }
}
