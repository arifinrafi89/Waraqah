import '../../../../core/usecase/usecase.dart';
import '../entities/book_series.dart';
import '../repositories/book_extras_repository.dart';

/// The series a book belongs to, in reading order, or `null`.
class GetSeries extends UseCase<BookSeries?, String> {
  GetSeries(this._repository);

  final BookExtrasRepository _repository;

  @override
  Future<BookSeries?> call(String params) async =>
      (await _repository.series(params))?.inOrder;
}

/// A series by its own id, in reading order, or `null`.
class GetSeriesById extends UseCase<BookSeries?, String> {
  GetSeriesById(this._repository);

  final BookExtrasRepository _repository;

  @override
  Future<BookSeries?> call(String params) async =>
      (await _repository.seriesById(params))?.inOrder;
}
