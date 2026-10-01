import 'package:dio/dio.dart';

import '../models/book_question_model.dart';
import 'book_question_fixtures.dart';

/// Q&A's fake endpoints, merged into `FakeApiInterceptor` by
/// `app/fake_api_routes.dart`. Every endpoint answers the book's questions.
///
/// The fake takes the poster's name and staff flag in the body; the real
/// backend reads them from the signed-in account instead.
abstract final class BookQuestionsFakeApi {
  /// `?id=<bookId>`.
  static const String questions = '/books/questions';

  /// Body: `{bookId, text, name}`.
  static const String ask = '/books/questions/ask';

  /// Body: `{bookId, questionId, text, name, isStaff}`.
  static const String answer = '/books/questions/answer';

  /// Starts from the demo questions; new posts last for this interceptor.
  static Map<String, Object? Function(RequestOptions)> routes({
    DateTime Function() clock = DateTime.now,
  }) {
    final byBook = BookQuestionFixtures.seed(clock());
    var nextId = 1;
    List<Object?> answerFor(String bookId) => [
      for (final q in byBook[bookId] ?? const <BookQuestionModel>[]) q.toJson(),
    ];
    return {
      questions: (o) => answerFor(o.queryParameters['id'] as String? ?? ''),
      ask: (o) {
        final body = o.data as Map<String, dynamic>;
        final bookId = body['bookId'] as String;
        byBook
            .putIfAbsent(bookId, () => [])
            .add(
              BookQuestionModel(
                id: 'q-new-${nextId++}',
                text: body['text'] as String,
                askerName: body['name'] as String,
                askedAt: clock(),
              ),
            );
        return answerFor(bookId);
      },
      answer: (o) {
        final body = o.data as Map<String, dynamic>;
        final bookId = body['bookId'] as String;
        final list = byBook[bookId] ?? [];
        final i = list.indexWhere((q) => q.id == body['questionId']);
        if (i >= 0) {
          list[i] = list[i].copyWith(
            answers: [
              ...list[i].answers,
              BookAnswerModel(
                id: 'a-new-${nextId++}',
                text: body['text'] as String,
                authorName: body['name'] as String,
                answeredAt: clock(),
                isStaff: body['isStaff'] == true,
              ),
            ],
          );
        }
        return answerFor(bookId);
      },
    };
  }
}
