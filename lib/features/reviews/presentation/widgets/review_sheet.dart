import 'package:flutter/material.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/review.dart';
import '../../domain/entities/review_rules.dart';
import 'review_stars.dart';

typedef ReviewInput = ({int stars, String text});

/// The write/edit sheet: a star picker and optional text. `null` when the
/// Reader closes it.
Future<ReviewInput?> showReviewSheet(BuildContext context, {Review? mine}) =>
    showModalBottomSheet<ReviewInput>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _ReviewSheet(mine: mine),
    );

class _ReviewSheet extends StatefulWidget {
  const _ReviewSheet({this.mine});

  final Review? mine;

  @override
  State<_ReviewSheet> createState() => _ReviewSheetState();
}

class _ReviewSheetState extends State<_ReviewSheet> {
  late int _stars = widget.mine?.stars ?? 0;
  late final _text = TextEditingController(text: widget.mine?.text ?? '');

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppL10n.of(context)!;
    final ok = ReviewRules.check(_stars, _text.text) == null;
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
        children: [
          Text(
            l10n.reviewYourRating,
            style: AppFonts.ui(
              size: 15,
              weight: FontWeight.w800,
              color: context.palette.text,
            ),
          ),
          ReviewStars(
            stars: _stars,
            size: 30,
            onPick: (n) => setState(() => _stars = n),
          ),
          TextField(
            controller: _text,
            minLines: 3,
            maxLines: 8,
            maxLength: ReviewRules.maxText,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(hintText: l10n.reviewTextHint),
          ),
          const SizedBox(height: Insets.md),
          FilledButton(
            onPressed: ok
                ? () => Navigator.pop<ReviewInput>(context, (
                    stars: _stars,
                    text: _text.text.trim(),
                  ))
                : null,
            child: Text(l10n.reviewSave),
          ),
        ],
      ),
    );
  }
}
