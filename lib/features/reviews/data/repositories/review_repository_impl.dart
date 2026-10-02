import '../../domain/entities/review.dart';
import '../../domain/repositories/review_repository.dart';
import '../models/review_model.dart';
import '../sources/review_remote_source.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  ReviewRepositoryImpl(this._source);

  final ReviewRemoteSource _source;

  @override
  Future<BookReviews> reviews(String bookId) async =>
      (await _source.reviews(bookId)).toEntity();

  @override
  Future<BookReviews> save(String bookId, int stars, String text) async =>
      (await _source.save(bookId, stars, text)).toEntity();

  @override
  Future<BookReviews> delete(String bookId) async =>
      (await _source.delete(bookId)).toEntity();
}
