import '../../../../core/usecase/usecase.dart';
import '../entities/shelf_entry.dart';
import '../repositories/shelf_repository.dart';

/// Puts a Book on a shelf, or takes it off.
class MoveToShelf extends UseCase<List<ShelfEntry>, ShelfMove> {
  MoveToShelf(this._repository);

  final ShelfRepository _repository;

  @override
  Future<List<ShelfEntry>> call(ShelfMove params) => _repository.move(params);
}
