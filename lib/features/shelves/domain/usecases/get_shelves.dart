import '../../../../core/usecase/usecase.dart';
import '../entities/shelf_entry.dart';
import '../repositories/shelf_repository.dart';

/// The reader's shelves.
class GetShelves extends UseCase<List<ShelfEntry>, NoParams> {
  GetShelves(this._repository);

  final ShelfRepository _repository;

  @override
  Future<List<ShelfEntry>> call(NoParams params) => _repository.mine();
}
