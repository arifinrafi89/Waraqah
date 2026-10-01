import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../book_request/book_request_routes.dart';
import 'scan_actions.dart';

/// A valid ISBN Waraqah doesn't have: ask for it, or list it anyway.
class ScanNotFound extends ConsumerWidget {
  const ScanNotFound({super.key, required this.isbn, required this.forSell});

  final String isbn;
  final bool forSell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.sm,
        children: [
          Text(l10n.scanNotFoundTitle, style: context.texts.titleSmall),
          Text(
            l10n.scanNotFoundBody(isbn),
            style: AppFonts.ui(size: 12.5, color: palette.textDim),
          ),
          const SizedBox(height: Insets.sm),
          SecondaryButton(
            label: l10n.scanRequest,
            onPressed: () => context.push(BookRequestRoutes.newRequest),
          ),
          TextButton(
            onPressed: () => ref.sellCopy(context, null, forSell: forSell),
            child: Text(l10n.scanListAnyway),
          ),
        ],
      ),
    );
  }
}
