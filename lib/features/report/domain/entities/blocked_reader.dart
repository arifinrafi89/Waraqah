import 'package:freezed_annotation/freezed_annotation.dart';

part 'blocked_reader.freezed.dart';

/// A reader the signed-in reader blocked. Their Listings stay out of the
/// marketplace and the book page until they're unblocked.
@freezed
abstract class BlockedReader with _$BlockedReader {
  const factory BlockedReader({
    required String id,
    required String name,
    required DateTime blockedAt,
  }) = _BlockedReader;
}
