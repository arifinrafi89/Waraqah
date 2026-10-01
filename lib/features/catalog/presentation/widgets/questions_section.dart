import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../core/widgets/surface_card.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../providers/book_questions_providers.dart';
import 'question_actions.dart';
import 'question_tile.dart';

/// On the book's page: the two newest questions with one answer each, a
/// link to all of them, and Ask a question.
class QuestionsSection extends ConsumerWidget {
  const QuestionsSection({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    final questions = ref.watch(questionsProvider(bookId));
    final count = questions.value?.length ?? 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(
          title: l10n.bookQuestionsTitle,
          subtitle: l10n.bookQuestionsCount(count),
          actionLabel: count > 2 ? l10n.commonSeeAll : null,
          onAction: () => context.push(CatalogRoutes.questionsFor(bookId)),
        ),
        AsyncView(
          value: questions,
          errorLabel: l10n.commonSomethingWentWrong,
          retryLabel: l10n.commonRetry,
          onRetry: () => ref.invalidate(questionsProvider(bookId)),
          skeleton: const ShimmerBox(height: 110, radius: Radii.card),
          builder: (all) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: Insets.md,
            children: [
              if (all.isNotEmpty)
                SurfaceCard(
                  padding: const EdgeInsets.all(Insets.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (final (i, q) in all.take(2).indexed) ...[
                        if (i > 0)
                          Divider(
                            height: Insets.xl,
                            color: context.palette.border,
                          ),
                        QuestionTile(question: q, maxAnswers: 1),
                      ],
                    ],
                  ),
                ),
              SecondaryButton(
                label: l10n.bookAskQuestion,
                icon: const Icon(Icons.help_outline_rounded, size: 18),
                onPressed: () => ref.askOrAnswer(context, bookId),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
