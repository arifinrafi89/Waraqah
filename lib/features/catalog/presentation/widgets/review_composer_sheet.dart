import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_review.dart';

Future<BookReview?> showReviewComposer(BuildContext context) =>
    showModalBottomSheet<BookReview>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const _ReviewComposer(),
    );

class _ReviewComposer extends StatefulWidget {
  const _ReviewComposer();

  @override
  State<_ReviewComposer> createState() => _ReviewComposerState();
}

class _ReviewComposerState extends State<_ReviewComposer> {
  final _text = TextEditingController();
  var _rating = 0;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        Insets.screen,
        Insets.lg,
        Insets.screen,
        MediaQuery.viewInsetsOf(context).bottom + Insets.lg,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: Insets.md,
        children: [
          Text(
            l10n.bookReviewWrite,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(l10n.bookReviewYourRating),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var star = 1; star <= 5; star++)
                IconButton(
                  tooltip: '$star',
                  icon: Icon(
                    star <= _rating
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                  ),
                  onPressed: () => setState(() => _rating = star),
                ),
            ],
          ),
          TextField(
            controller: _text,
            onChanged: (_) => setState(() {}),
            maxLines: 5,
            maxLength: 500,
            decoration: InputDecoration(hintText: l10n.bookReviewHint),
          ),
          FilledButton(
            onPressed: _rating == 0 || _text.text.trim().isEmpty
                ? null
                : () => Navigator.pop(
                    context,
                    BookReview(
                      id: 'review-${DateTime.now().microsecondsSinceEpoch}',
                      reviewerName: l10n.bitesYou,
                      reviewerHandle: l10n.bitesReaderHandle,
                      rating: _rating,
                      text: _text.text.trim(),
                    ),
                  ),
            child: Text(l10n.bookReviewSubmit),
          ),
        ],
      ),
    );
  }
}
