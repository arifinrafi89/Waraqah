import '../models/wanted_book_model.dart';
import 'book_request_fake_store.dart';

/// Demand for admins, from every reader's open requests.
extension BookRequestDemand on BookRequestFakeStore {
  /// Open requests per title, most asked first.
  List<Map<String, dynamic>> demand() {
    final counts = <String, int>{};
    for (final r in requests.where((r) => r.isOpen)) {
      counts[r.title] = (counts[r.title] ?? 0) + 1;
    }
    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return [
      for (final e in sorted)
        BookDemandModel(title: e.key, requests: e.value).toJson(),
    ];
  }
}
