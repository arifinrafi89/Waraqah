import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/dio_provider.dart';
import '../../../auth/presentation/providers/auth_providers.dart';
import '../../data/repositories/book_questions_repository_impl.dart';
import '../../data/sources/book_questions_source.dart';
import '../../domain/entities/book_question.dart';
import '../../domain/repositories/book_questions_repository.dart';
import '../../domain/usecases/get_questions.dart';
import '../../domain/usecases/post_question_or_answer.dart';

final bookQuestionsRepositoryProvider = Provider<BookQuestionsRepository>(
  (ref) =>
      BookQuestionsRepositoryImpl(BookQuestionsSource(ref.watch(dioProvider))),
);

final getQuestionsProvider = Provider<GetQuestions>(
  (ref) => GetQuestions(ref.watch(bookQuestionsRepositoryProvider)),
);

final postQuestionOrAnswerProvider = Provider<PostQuestionOrAnswer>(
  (ref) => PostQuestionOrAnswer(ref.watch(bookQuestionsRepositoryProvider)),
);

/// One book's questions and answers, by book id.
class QuestionsNotifier extends AsyncNotifier<List<BookQuestion>> {
  QuestionsNotifier(this.bookId);

  final String bookId;

  @override
  Future<List<BookQuestion>> build() =>
      ref.read(getQuestionsProvider).call(bookId);

  /// Asks a question, or answers [questionId]. Throws `PostRejected` when
  /// the text doesn't fit, and [StateError] for a guest.
  Future<void> post(String text, {String? questionId}) async {
    final user = ref.read(sessionProvider);
    if (user == null) throw StateError('Log in to post.');
    state = AsyncData(
      await ref
          .read(postQuestionOrAnswerProvider)
          .call(
            PostParams(
              bookId: bookId,
              text: text,
              user: user,
              questionId: questionId,
            ),
          ),
    );
  }
}

final questionsProvider =
    AsyncNotifierProvider.family<QuestionsNotifier, List<BookQuestion>, String>(
      QuestionsNotifier.new,
    );
