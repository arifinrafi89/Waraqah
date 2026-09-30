import '../../../../core/usecase/usecase.dart';
import '../entities/used_options.dart';
import '../repositories/used_options_repository.dart';

/// Used copies of a book, cheapest reader listings first.
class GetUsedOptions extends UseCase<UsedOptions, String> {
  GetUsedOptions(this._repository);

  final UsedOptionsRepository _repository;

  @override
  Future<UsedOptions> call(String params) async {
    final options = await _repository.forBook(params);
    final listings = [...options.listings]
      ..sort((a, b) => a.priceBdt.compareTo(b.priceBdt));
    return options.copyWith(listings: listings);
  }
}
