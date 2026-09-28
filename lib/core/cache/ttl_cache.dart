/// A tiny time-to-live cache used by every repository.
///
/// Repeated visits to a tab read straight from memory instead of hitting the
/// network again, which is what makes tab switching feel instant. Entries older
/// than [ttl] are discarded on read, so data never goes stale silently.
class TtlCache<T> {
  TtlCache({this.ttl = const Duration(minutes: 5)});

  final Duration ttl;
  final Map<String, _Entry<T>> _entries = {};

  T? read(String key) {
    final entry = _entries[key];
    if (entry == null) return null;
    if (DateTime.now().difference(entry.storedAt) > ttl) {
      _entries.remove(key);
      return null;
    }
    return entry.value;
  }

  void write(String key, T value) =>
      _entries[key] = _Entry(value, DateTime.now());

  /// Read-through helper: returns the cached value or awaits and stores [load].
  Future<T> resolve(String key, Future<T> Function() load) async {
    final cached = read(key);
    if (cached != null) return cached;
    final fresh = await load();
    write(key, fresh);
    return fresh;
  }

  void invalidate(String key) => _entries.remove(key);
  void clear() => _entries.clear();
}

class _Entry<T> {
  const _Entry(this.value, this.storedAt);
  final T value;
  final DateTime storedAt;
}
