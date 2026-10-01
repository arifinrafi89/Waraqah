import '../entities/used_options.dart';

/// The second-hand ways to get one book.
abstract interface class UsedOptionsRepository {
  Future<UsedOptions> forBook(String bookId);
}
