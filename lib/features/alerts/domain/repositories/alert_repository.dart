import '../entities/book_alert.dart';

/// The signed-in reader's alerts. Changes answer the whole list.
abstract interface class AlertRepository {
  Future<List<BookAlert>> alerts();

  /// Setting an alert again replaces the old one for that Edition and kind.
  Future<List<BookAlert>> set(AlertRequest request);

  Future<List<BookAlert>> remove(String alertId);
}
