import '../../../../core/usecase/usecase.dart';
import '../entities/shelf_entry.dart';
import '../repositories/shelf_repository.dart';

/// Saves how far the reader got in a Book.
class UpdateProgress extends UseCase<List<ShelfEntry>, ProgressUpdate> {
  UpdateProgress(this._repository);

  final ShelfRepository _repository;

  @override
  Future<List<ShelfEntry>> call(ProgressUpdate params) =>
      _repository.progress(params);
}
