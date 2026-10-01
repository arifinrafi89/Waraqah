import '../../../../core/usecase/usecase.dart';
import '../entities/isbn.dart';
import '../entities/scanned_book.dart';
import '../repositories/scan_repository.dart';

/// Finds the catalog Book for a scanned or typed ISBN. Throws
/// [FormatException] when it isn't a valid ISBN; answers `null` when it is
/// one Waraqah doesn't have.
class LookUpIsbn extends UseCase<ScannedBook?, String> {
  LookUpIsbn(this._repository);

  final ScanRepository _repository;

  @override
  Future<ScannedBook?> call(String params) {
    final isbn = Isbn.normalize(params);
    if (isbn == null) throw FormatException('Not an ISBN', params);
    return _repository.lookUp(isbn);
  }
}
