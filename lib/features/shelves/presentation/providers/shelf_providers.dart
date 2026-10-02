import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/shelf_entry.dart';

class ShelvesNotifier extends AsyncNotifier<List<ShelfEntry>> {
  @override
  Future<List<ShelfEntry>> build() async => [
    const ShelfEntry(
      id: 'shelf-atomic',
      bookId: 'bk-atomic',
      title: 'Atomic Habits',
      author: 'James Clear',
      status: ShelfStatus.wantToRead,
    ),
    const ShelfEntry(
      id: 'shelf-sapiens',
      bookId: 'bk-sapiens',
      title: 'Sapiens: A Brief History of Humankind',
      author: 'Yuval Noah Harari',
      status: ShelfStatus.reading,
      progress: 0.32,
      addedAfterDelivery: true,
    ),
    const ShelfEntry(
      id: 'shelf-fiqh',
      bookId: 'bk-fiqh',
      title: 'Fiqh us-Sunnah, Vol. 1',
      author: 'Sayyid Sabiq',
      status: ShelfStatus.finished,
      progress: 1,
    ),
  ];

  void move(String id, ShelfStatus status) {
    final current = state.asData?.value;
    if (current == null) return;
    state = AsyncData([
      for (final entry in current)
        entry.id == id
            ? entry.copyWith(
                status: status,
                progress: status == ShelfStatus.finished ? 1 : entry.progress,
              )
            : entry,
    ]);
  }

  void setProgress(String id, double progress) {
    final current = state.asData?.value;
    if (current == null) return;
    state = AsyncData([
      for (final entry in current)
        entry.id == id
            ? entry.copyWith(
                progress: progress,
                status: progress >= 1
                    ? ShelfStatus.finished
                    : ShelfStatus.reading,
              )
            : entry,
    ]);
  }

  void addDeliveredBook({
    required String id,
    String? bookId,
    required String title,
    required String author,
  }) {
    final current = state.asData?.value ?? const [];
    if (current.any((entry) => entry.id == id)) return;
    state = AsyncData([
      ...current,
      ShelfEntry(
        id: id,
        bookId: bookId,
        title: title,
        author: author,
        status: ShelfStatus.reading,
        addedAfterDelivery: true,
      ),
    ]);
  }
}

final shelvesProvider =
    AsyncNotifierProvider<ShelvesNotifier, List<ShelfEntry>>(
      ShelvesNotifier.new,
    );
