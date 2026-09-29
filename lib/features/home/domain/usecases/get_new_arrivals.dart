import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../catalog/domain/repositories/book_repository.dart';
import '../entities/benefit_filter.dart';

/// New arrivals for the home screen, narrowed by the curation filter.
///
/// Searches the full catalog (not just the catalog's own "new arrivals"
/// slice) so a filter always has the whole shelf to match against, keeps the
/// catalog's price-then-rating sort, then takes at most 8.
class GetNewArrivals extends UseCase<List<Book>, BenefitFilter> {
  GetNewArrivals(this._repository);

  final BookRepository _repository;

  @override
  Future<List<Book>> call(BenefitFilter params) async {
    final books = await _repository.searchCatalog();
    final matched = switch (params) {
      BenefitFilter.all => books,
      BenefitFilter.beneficial => books.where((b) => b.isBeneficial).toList(),
      BenefitFilter.nonBeneficial =>
        books.where((b) => !b.isBeneficial).toList(),
    };
    return matched.take(8).toList();
  }
}
