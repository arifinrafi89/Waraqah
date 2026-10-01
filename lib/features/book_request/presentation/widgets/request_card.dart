import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_request.dart';
import 'request_actions.dart';

/// One request: the book, the price limit, how many copies match now, and
/// See copies or Close.
class RequestCard extends ConsumerWidget {
  const RequestCard({super.key, required this.request});

  final BookRequest request;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final dim = AppFonts.ui(size: 12, color: palette.textDim);
    final details = [
      ?request.author,
      if (request.maxPriceBdt case final price?)
        l10n.requestUnder(Bdt.format(price)),
    ];
    return SurfaceCard(
      padding: const EdgeInsets.all(Insets.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(request.title, style: context.texts.titleSmall),
              ),
              if (!request.isOpen) MiniTag(label: l10n.requestClosed),
            ],
          ),
          if (details.isNotEmpty) Text(details.join(' · '), style: dim),
          if (request.note case final note?) Text(note, style: dim),
          if (request.isOpen) ...[
            Text(
              l10n.requestMatches(request.matchCount),
              style: AppFonts.ui(
                size: 12.5,
                weight: FontWeight.w700,
                color: request.matchCount > 0 ? palette.accent : palette.text,
              ),
            ),
            Row(
              children: [
                if (request.matchCount > 0)
                  TextButton(
                    onPressed: () => ref.seeCopies(context, request),
                    child: Text(l10n.requestSeeCopies),
                  ),
                const Spacer(),
                TextButton(
                  onPressed: () => ref.closeRequest(context, request.id),
                  style: TextButton.styleFrom(foregroundColor: palette.textDim),
                  child: Text(l10n.requestClose),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
