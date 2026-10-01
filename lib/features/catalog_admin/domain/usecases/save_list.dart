import '../../../../core/usecase/usecase.dart';
import '../entities/list_draft.dart';
import '../entities/list_rules.dart';
import '../repositories/catalog_admin_repository.dart';

/// Adds or saves a Collection, or a Staff Booklist when the draft has a
/// kind. Refuses one that breaks [ListRules].
class SaveList extends UseCase<void, ListDraft> {
  SaveList(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<void> call(ListDraft params) {
    final problems = ListRules.check(params);
    if (problems.isNotEmpty) {
      throw ArgumentError.value(params, 'draft', problems.first.name);
    }
    return _repository.saveList(params);
  }
}

/// Deletes a Collection, or a Staff Booklist when `booklist` is true.
class DeleteList extends UseCase<void, ({String id, bool booklist})> {
  DeleteList(this._repository);

  final CatalogAdminRepository _repository;

  @override
  Future<void> call(({String id, bool booklist}) params) =>
      _repository.deleteList(params.id, booklist: params.booklist);
}
