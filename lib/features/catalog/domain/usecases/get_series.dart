import '../../../../core/usecase/usecase.dart';
import '../entities/book_series.dart';
import '../repositories/book_extras_repository.dart';

/// The series a book belongs to, in reading order, or `null`.
class GetSeries extends UseCase<BookSeries?, String> {
  GetSeries(this._repository);

  final BookExtrasRepository _repository;

  @override
  Future<BookSeries?> call(String params) async {
    final series = await _repository.series(params);
    if (series == null) return null;
    final ordered = [...series.entries]
      ..sort((a, b) => a.position.compareTo(b.position));
    return series.copyWith(entries: ordered);
  }
}
