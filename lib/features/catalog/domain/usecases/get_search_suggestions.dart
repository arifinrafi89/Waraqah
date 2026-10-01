import '../../../../core/usecase/usecase.dart';
import '../repositories/book_repository.dart';

/// Titles and Author names to offer while the reader types.
class GetSearchSuggestions extends UseCase<List<String>, String> {
  GetSearchSuggestions(this._repository);

  final BookRepository _repository;

  @override
  Future<List<String>> call(String params) => _repository.suggest(params);
}

/// The title a query with no results most likely meant, or `null`.
class GetDidYouMean extends UseCase<String?, String> {
  GetDidYouMean(this._repository);

  final BookRepository _repository;

  @override
  Future<String?> call(String params) => _repository.didYouMean(params);
}
