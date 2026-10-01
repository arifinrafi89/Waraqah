import '../../../../core/models/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/catalog_admin_repository.dart';

/// Takes a Book off the storefront, or puts it back.
class SetBookHidden extends UseCase<Book, (String, bool)> {
  SetBookHidden(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<Book> call((String, bool) params) =>
      _repository.setHidden(params.$1, hidden: params.$2);
}
