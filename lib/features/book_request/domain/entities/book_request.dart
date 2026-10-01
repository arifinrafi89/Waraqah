import 'package:freezed_annotation/freezed_annotation.dart';

part 'book_request.freezed.dart';

/// "Looking for Calculus by Stewart under ৳900": a reader asking for a
/// book. Admins see it as demand; readers selling it are told.
@freezed
abstract class BookRequest with _$BookRequest {
  const factory BookRequest({
    required String id,
    required String title,
    required DateTime createdAt,
    String? author,

    /// The catalog Book, when it came from Search or the scanner.
    String? bookId,
    int? maxPriceBdt,
    String? note,
    @Default(true) bool isOpen,

    /// Readers' copies on sale now that match.
    @Default(0) int matchCount,

    /// Readers who have the book and were told about this request.
    @Default(0) int notifiedSellers,
  }) = _BookRequest;
}

/// What a reader fills in to ask for a book.
@freezed
abstract class BookRequestDraft with _$BookRequestDraft {
  const factory BookRequestDraft({
    required String title,
    String? author,
    String? bookId,
    int? maxPriceBdt,
    String? note,
  }) = _BookRequestDraft;
}

/// Another reader's open request for a book the signed-in reader is
/// selling: the seller's side of "sellers who have it get notified".
@freezed
abstract class WantedBook with _$WantedBook {
  const factory WantedBook({
    required String requestId,
    required String readerName,
    required String title,
    required String listingId,
    required DateTime createdAt,
    int? maxPriceBdt,
  }) = _WantedBook;
}

/// How many readers asked for a title: demand, for admins.
@freezed
abstract class BookDemand with _$BookDemand {
  const factory BookDemand({required String title, required int requests}) =
      _BookDemand;
}
