import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/book_extras_repository.dart';

/// Which of a book's Editions get the "Lowest in 30 days" badge: on sale
/// today, and at or below every price they had in the last 30 days.
class GetLowestPriceEditions extends UseCase<Set<String>, Book> {
  GetLowestPriceEditions(this._repository);

  final BookExtrasRepository _repository;

  @override
  Future<Set<String>> call(Book params) async {
    final lows = await _repository.priceLows(params.id);
    return {
      for (final edition in params.editions)
        if (edition.isDiscounted &&
            edition.priceBdt <= (lows[edition.id] ?? edition.priceBdt))
          edition.id,
    };
  }
}
