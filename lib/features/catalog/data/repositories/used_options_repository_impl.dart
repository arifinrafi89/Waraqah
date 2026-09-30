import '../../domain/entities/used_options.dart';
import '../../domain/repositories/used_options_repository.dart';
import '../models/used_options_model.dart';
import '../sources/used_options_source.dart';

/// No cache: used copies sell quickly.
class UsedOptionsRepositoryImpl implements UsedOptionsRepository {
  UsedOptionsRepositoryImpl(this._source);

  final UsedOptionsSource _source;

  @override
  Future<UsedOptions> forBook(String bookId) async =>
      (await _source.forBook(bookId)).toEntity();
}
