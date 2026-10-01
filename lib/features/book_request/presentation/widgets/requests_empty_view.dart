import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../l10n/app_localizations.dart';
import '../../book_request_routes.dart';

/// No requests yet: what they're for, and a way to make one.
class RequestsEmptyView extends StatelessWidget {
  const RequestsEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Insets.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: Insets.sm,
          children: [
            Icon(
              Icons.manage_search_rounded,
              size: 44,
              color: palette.textFaint,
            ),
            Text(l10n.requestEmptyTitle, style: context.texts.titleMedium),
            Text(
              l10n.requestEmptyBody,
              textAlign: TextAlign.center,
              style: AppFonts.ui(size: 12.5, color: palette.textDim),
            ),
            const SizedBox(height: Insets.sm),
            SecondaryButton(
              label: l10n.requestTitle,
              onPressed: () => context.push(BookRequestRoutes.newRequest),
            ),
          ],
        ),
      ),
    );
  }
}
