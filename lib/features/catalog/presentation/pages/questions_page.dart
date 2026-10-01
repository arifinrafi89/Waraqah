import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/widgets/app_buttons.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/async_view.dart';
import '../../../../core/widgets/shimmer_box.dart';
import '../../../../l10n/app_localizations.dart';
import '../../catalog_routes.dart';
import '../providers/book_questions_providers.dart';
import '../widgets/question_actions.dart';
import '../widgets/question_tile.dart';

/// `/catalog/book/:id/questions`: every question about the book with all
/// its answers, an Answer button on each, and Ask a question at the bottom.
class QuestionsPage extends ConsumerWidget {
  const QuestionsPage({super.key, required this.bookId});

  final String bookId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppL10n.of(context)!;
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Insets.screen),
          child: PrimaryButton(
            label: l10n.bookAskQuestion,
            onPressed: () => ref.askOrAnswer(context, bookId),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(Insets.md, 6, Insets.md, 10),
              child: Row(
                spacing: Insets.md,
                children: [
                  AppIconButton(
                    icon: Icons.arrow_back_rounded,
                    onPressed: () => context.canPop()
                        ? context.pop()
                        : context.go(CatalogRoutes.bookDetailFor(bookId)),
                  ),
                  Flexible(
                    child: Text(
                      l10n.bookQuestionsTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.texts.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: AsyncView(
                value: ref.watch(questionsProvider(bookId)),
                errorLabel: l10n.commonSomethingWentWrong,
                retryLabel: l10n.commonRetry,
                onRetry: () => ref.invalidate(questionsProvider(bookId)),
                skeleton: const Padding(
                  padding: EdgeInsets.all(Insets.screen),
                  child: ShimmerBox(height: 240, radius: Radii.card),
                ),
                builder: (questions) => questions.isEmpty
                    ? Center(child: Text(l10n.bookQuestionsEmpty))
                    : ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          Insets.screen,
                          0,
                          Insets.screen,
                          Insets.xl,
                        ),
                        itemCount: questions.length,
                        separatorBuilder: (_, _) => Divider(
                          height: Insets.xl,
                          color: context.palette.border,
                        ),
                        itemBuilder: (_, i) => QuestionTile(
                          key: ValueKey(questions[i].id),
                          question: questions[i],
                          onAnswer: () => ref.askOrAnswer(
                            context,
                            bookId,
                            question: questions[i],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
