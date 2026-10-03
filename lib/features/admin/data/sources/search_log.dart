import 'package:dio/dio.dart';

/// What readers search the catalog for, counted, for the dashboard. Live
/// search sends every keystroke, so a term that grows from the last one
/// ("sap" → "sapiens") replaces it.
class SearchLog {
  SearchLog() {
    _counts.addAll(_seed);
  }

  static const Map<String, int> _seed = {
    'sapiens': 14,
    'ssc physics': 11,
    'humayun ahmed': 9,
    'atomic habits': 7,
    'tafsir': 5,
  };

  final Map<String, int> _counts = {};
  String? _last;

  void record(String? query) {
    final term = (query ?? '').trim().toLowerCase();
    if (term.length < 3) return;
    final last = _last;
    if (last != null && (term.startsWith(last) || last.startsWith(term))) {
      final n = (_counts[last] ?? 1) - 1;
      n <= 0 ? _counts.remove(last) : _counts[last] = n;
    }
    _counts.update(term, (n) => n + 1, ifAbsent: () => 1);
    _last = term;
  }

  /// The most searched terms, most first.
  List<Map<String, dynamic>> top([int count = 5]) {
    final sorted = _counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return [
      for (final e in sorted.take(count)) {'term': e.key, 'count': e.value},
    ];
  }

  /// [routes] with the catalog search (`/books?q=`) counted on the way
  /// through; Staff's own list (`includeHidden`) isn't a reader's search.
  Map<String, Object? Function(RequestOptions)> counting(
    Map<String, Object? Function(RequestOptions)> routes,
    String path,
  ) => {
    ...routes,
    path: (options) {
      final q = options.queryParameters;
      if (q['includeHidden'] != 'true') record(q['q'] as String?);
      return routes[path]!(options);
    },
  };
}
