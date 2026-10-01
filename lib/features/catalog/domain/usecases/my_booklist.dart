import '../../../../core/usecase/usecase.dart';
import '../entities/booklist.dart';
import '../repositories/booklist_repository.dart';

/// What to change on a Reader's own list. No [id] = a new list.
typedef MyBooklistChange = ({String? id, String? name, List<String>? bookIds});

/// Makes, renames or changes the books of a Reader's own list. A name must
/// not be blank.
class SaveMyBooklist extends UseCase<Booklist, MyBooklistChange> {
  SaveMyBooklist(this._repository);

  final BooklistRepository _repository;

  @override
  Future<Booklist> call(MyBooklistChange params) {
    final name = params.name?.trim();
    if (name != null && name.isEmpty) {
      throw ArgumentError.value(params.name, 'name', 'blank');
    }
    return _repository.saveMine(
      id: params.id,
      name: name,
      bookIds: params.bookIds,
    );
  }
}

class DeleteMyBooklist extends UseCase<void, String> {
  DeleteMyBooklist(this._repository);

  final BooklistRepository _repository;

  @override
  Future<void> call(String params) => _repository.deleteMine(params);
}
