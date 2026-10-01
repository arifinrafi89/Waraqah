import 'book_request.dart';

enum RequestProblem { titleMissing, titleTooLong, badPrice, noteTooLong }

/// What a request needs before it's sent, checked in the app and by the
/// server.
abstract final class RequestRules {
  static const int maxTitle = 120;
  static const int maxNote = 300;

  /// `null` when it can be sent.
  static RequestProblem? check(BookRequestDraft draft) {
    final title = draft.title.trim();
    if (title.length < 2) return RequestProblem.titleMissing;
    if (title.length > maxTitle) return RequestProblem.titleTooLong;
    final price = draft.maxPriceBdt;
    if (price != null && price <= 0) return RequestProblem.badPrice;
    if ((draft.note?.trim().length ?? 0) > maxNote) {
      return RequestProblem.noteTooLong;
    }
    return null;
  }

  /// Whether a used copy titled [listingTitle] (of [listingBookId]) is the
  /// book [request] asks for: the same catalog Book, or the same words.
  static bool matches(
    BookRequestDraft request,
    String listingTitle,
    String? listingBookId,
  ) {
    if (request.bookId != null && request.bookId == listingBookId) return true;
    String words(String text) =>
        text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9ঀ-৿]+'), ' ');
    final wanted = words(request.title).trim();
    final title = words(listingTitle).trim();
    return wanted.isNotEmpty &&
        (title.contains(wanted) || wanted.contains(title));
  }
}
