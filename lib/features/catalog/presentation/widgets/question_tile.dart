import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/tags.dart';
import '../../../../l10n/app_localizations.dart';
import '../../domain/entities/book_question.dart';

/// A question with who asked and when, then its answers (Waraqah's marked),
/// or "No answer yet". [onAnswer] adds an Answer button.
class QuestionTile extends StatelessWidget {
  const QuestionTile({
    super.key,
    required this.question,
    this.maxAnswers,
    this.onAnswer,
  });

  final BookQuestion question;

  /// `null` shows every answer.
  final int? maxAnswers;
  final VoidCallback? onAnswer;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final l10n = AppL10n.of(context)!;
    final date = DateFormat.yMMMd(
      Localizations.localeOf(context).toLanguageTag(),
    );
    final faint = AppFonts.ui(size: 11, color: palette.textFaint);
    final answers = maxAnswers == null
        ? question.answers
        : question.answers.take(maxAnswers!);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(question.text, style: context.texts.titleSmall),
        Text(
          '${question.askerName} · ${date.format(question.askedAt)}',
          style: faint,
        ),
        if (question.answers.isEmpty)
          Text(
            l10n.bookNoAnswerYet,
            style: faint.copyWith(fontStyle: FontStyle.italic),
          ),
        for (final answer in answers)
          Padding(
            padding: const EdgeInsets.only(left: Insets.md, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                Text(
                  answer.text,
                  style: AppFonts.ui(
                    size: 12.5,
                    height: 1.45,
                    color: palette.textDim,
                  ),
                ),
                Wrap(
                  spacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      '${answer.authorName} · ${date.format(answer.answeredAt)}',
                      style: faint,
                    ),
                    if (answer.isStaff) MiniTag(label: l10n.bookFromWaraqah),
                  ],
                ),
              ],
            ),
          ),
        if (onAnswer != null)
          TextButton(
            onPressed: onAnswer,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(l10n.bookAnswer),
          ),
      ],
    );
  }
}
