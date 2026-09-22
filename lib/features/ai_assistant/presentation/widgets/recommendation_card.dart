import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/cover_art.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/recommended_book_provider.dart';

/// The compact book card an assistant reply attaches to its recommendation.
class RecommendationCard extends ConsumerWidget {
  const RecommendationCard({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final book = ref.watch(recommendedBookProvider(bookId)).value;
    if (book == null) return const SizedBox.shrink();

    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(Insets.sm),
      decoration: BoxDecoration(
        color: palette.bg,
        border: Border.all(color: palette.border),
        borderRadius: BorderRadius.circular(Radii.md),
      ),
      child: Row(
        spacing: 9,
        children: [
          SizedBox(
            width: 38,
            child: CoverArt(
              title: book.coverLabel,
              seed: book.coverSeed,
              aspectRatio: 38 / 52,
              fontSize: 7,
              radius: 7,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.ui(
                    size: 11.5,
                    weight: FontWeight.w800,
                    color: palette.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    '${book.author} · ${Bdt.format(book.priceBdt)}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.ui(size: 10, color: palette.textFaint),
                  ),
                ),
                Row(
                  spacing: 3,
                  children: [
                    Text(
                      l10n.aiViewBook,
                      style: AppFonts.ui(
                        size: 10,
                        weight: FontWeight.w800,
                        color: palette.accent,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      size: 11,
                      color: palette.accent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
