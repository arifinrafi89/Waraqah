import 'package:dio/dio.dart';

import '../../../auth/domain/entities/app_user.dart';
import '../../../auth/domain/entities/user_role.dart';
import '../models/book_question_model.dart';
import 'book_questions_fake_api.dart';

/// Talks to the `/books/questions` endpoints, answered for now by the fake
/// API.
class BookQuestionsSource {
  BookQuestionsSource(this._dio);

  final Dio _dio;

  Future<List<BookQuestionModel>> questions(String bookId) async => _list(
    await _dio.get<List<dynamic>>(
      BookQuestionsFakeApi.questions,
      queryParameters: {'id': bookId},
    ),
  );

  Future<List<BookQuestionModel>> ask(
    String bookId,
    String text,
    AppUser asker,
  ) async => _list(
    await _dio.post<List<dynamic>>(
      BookQuestionsFakeApi.ask,
      data: {'bookId': bookId, 'text': text, 'name': asker.name},
    ),
  );

  Future<List<BookQuestionModel>> answer(
    String bookId,
    String questionId,
    String text,
    AppUser author,
  ) async => _list(
    await _dio.post<List<dynamic>>(
      BookQuestionsFakeApi.answer,
      data: {
        'bookId': bookId,
        'questionId': questionId,
        'text': text,
        'name': author.name,
        'isStaff': author.role.isStaff,
      },
    ),
  );

  List<BookQuestionModel> _list(Response<List<dynamic>> response) => [
    for (final json in response.data ?? const [])
      BookQuestionModel.fromJson(json as Map<String, dynamic>),
  ];
}
