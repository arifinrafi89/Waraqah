import '../entities/reader_profile.dart';

/// Readers' pages and following them.
abstract interface class ReaderRepository {
  Future<ReaderProfile> reader(String id);

  /// Follows or unfollows; answers the Reader's page.
  Future<ReaderProfile> follow(String id, {required bool follow});
}
