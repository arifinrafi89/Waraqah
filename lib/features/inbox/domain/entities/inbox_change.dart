import 'package:freezed_annotation/freezed_annotation.dart';

part 'inbox_change.freezed.dart';

/// The server's live signal that a thread (and maybe its listing) changed:
/// a new message or offer, a decision, a read, a status change.
@freezed
abstract class InboxChange with _$InboxChange {
  const factory InboxChange({
    /// Counts up, so two changes to the same thread are still two events.
    required int seq,
    required String threadId,
    required String listingId,
  }) = _InboxChange;
}
