import 'package:flutter/material.dart';

import '../../../../../core/theme/app_dimens.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/theme/app_typography.dart';
import '../../../../../l10n/app_localizations.dart';
import '../book_tag_field.dart';
import 'quote_card_style.dart';

/// The card itself, 4:5: the quote large, "— Title, Author" and a small
/// Waraqah mark.
class QuoteCard extends StatelessWidget {
  const QuoteCard({
    super.key,
    required this.text,
    required this.style,
    this.book,
  });

  final String text;
  final QuoteCardStyle style;
  final BiteTag? book;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final ink = style.ink(palette);
    final source = [
      if (book != null) book!.title,
      if (book?.author.isNotEmpty ?? false) book!.author,
    ].join(', ');
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: style.background(palette, book?.id.hashCode ?? 0),
          borderRadius: BorderRadius.circular(Radii.card),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Insets.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.format_quote_rounded, size: 40, color: ink),
              Expanded(
                child: Center(
                  child: AutoSizeQuote(text: text, color: ink),
                ),
              ),
              if (source.isNotEmpty)
                Text(
                  '— $source',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.ui(
                    size: 13,
                    weight: FontWeight.w700,
                    color: ink,
                  ),
                ),
              const SizedBox(height: Insets.sm),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  AppL10n.of(context)!.quoteMark,
                  style: AppFonts.display(size: 14, color: ink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The quote, smaller as it gets longer, scaled down to fit.
class AutoSizeQuote extends StatelessWidget {
  const AutoSizeQuote({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) => FittedBox(
    fit: BoxFit.scaleDown,
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Text(
        text,
        style: AppFonts.ui(
          size: text.length > 140 ? 20 : 26,
          weight: FontWeight.w700,
          height: 1.35,
          color: color,
        ),
      ),
    ),
  );
}
