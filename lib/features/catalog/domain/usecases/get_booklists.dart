import '../../../../core/usecase/usecase.dart';
import '../entities/booklist.dart';
import '../repositories/booklist_repository.dart';

/// Every Staff Booklist and the Reader's own.
class GetBooklists extends UseCase<List<Booklist>, NoParams> {
  GetBooklists(this._repository);

  final BooklistRepository _repository;

  @override
  Future<List<Booklist>> call(NoParams params) => _repository.booklists();
}

/// One Booklist with its books in order, or `null`.
class GetBooklist extends UseCase<Booklist?, String> {
  GetBooklist(this._repository);

  final BooklistRepository _repository;

  @override
  Future<Booklist?> call(String params) => _repository.booklist(params);
}
