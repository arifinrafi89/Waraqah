import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../auth/auth_routes.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../domain/entities/book_question.dart';
import '../../domain/usecases/post_question_or_answer.dart';
import '../providers/book_questions_providers.dart';
import 'post_sheet.dart';

extension QuestionActions on WidgetRef {
  /// Opens the sheet to ask about the book, or to answer [question]. Guests
  /// are sent to log in first.
  Future<void> askOrAnswer(
    BuildContext context,
    String bookId, {
    BookQuestion? question,
  }) async {
    if (read(sessionProvider) == null) {
      await context.push(AuthRoutes.login);
      return;
    }
    final l10n = AppL10n.of(context)!;
    final messenger = ScaffoldMessenger.of(context);
    final questions = read(questionsProvider(bookId).notifier);
    final asking = question == null;
    final posted = await showPostSheet(
      context,
      title: asking ? l10n.bookAskQuestion : question.text,
      hint: asking ? l10n.bookQuestionHint : l10n.bookAnswerHint,
      maxLength: asking
          ? PostQuestionOrAnswer.questionLength.max
          : PostQuestionOrAnswer.answerLength.max,
      onPost: (text) => questions.post(text, questionId: question?.id),
    );
    if (posted == true) {
      messenger.showSnackBar(
        SnackBar(
          content: Text(
            asking ? l10n.bookQuestionPosted : l10n.bookAnswerPosted,
          ),
        ),
      );
    }
  }
}
