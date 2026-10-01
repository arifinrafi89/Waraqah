import '../entities/book_request.dart';

abstract interface class BookRequestRepository {
  Future<BookRequest> create(BookRequestDraft draft);

  /// The signed-in reader's requests, newest first.
  Future<List<BookRequest>> mine();

  /// Closes one; answers the reader's requests.
  Future<List<BookRequest>> close(String id);

  /// Other readers' open requests for books the reader is selling.
  Future<List<WantedBook>> wanted();

  /// Titles readers asked for, most asked first.
  Future<List<BookDemand>> demand();
}
