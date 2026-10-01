import '../../domain/entities/scanned_book.dart';
import '../../domain/repositories/scan_repository.dart';
import '../models/scanned_book_model.dart';
import '../sources/scan_remote_source.dart';

class ScanRepositoryImpl implements ScanRepository {
  ScanRepositoryImpl(this._source);

  final ScanRemoteSource _source;

  @override
  Future<ScannedBook?> lookUp(String isbn) async =>
      (await _source.lookUp(isbn))?.toEntity();
}
