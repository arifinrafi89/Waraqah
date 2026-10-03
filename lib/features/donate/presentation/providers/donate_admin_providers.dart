import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/book.dart';
import '../../../catalog/presentation/providers/catalog_providers.dart';
import '../../domain/entities/donate_place_draft.dart';
import '../../domain/usecases/find_book.dart';
import '../../domain/usecases/remove_place.dart';
import '../../domain/usecases/save_place.dart';
import 'donate_providers.dart';

final savePlaceProvider = Provider<SavePlace>(
  (ref) => SavePlace(ref.watch(donateRepositoryProvider)),
);

final removePlaceProvider = Provider<RemovePlace>(
  (ref) => RemovePlace(ref.watch(donateRepositoryProvider)),
);

/// A Book a place asks for, to show its title.
final placeBookProvider = FutureProvider.autoDispose.family<Book?, String>(
  (ref, id) => FindBook(ref.watch(bookRepositoryProvider)).call(id),
);

/// The place form, by place id (empty for a new place).
final placeDraftProvider = AsyncNotifierProvider.autoDispose
    .family<PlaceDraftNotifier, DonatePlaceDraft, String>(
      PlaceDraftNotifier.new,
    );

class PlaceDraftNotifier extends AsyncNotifier<DonatePlaceDraft> {
  PlaceDraftNotifier(this.id);

  final String id;

  @override
  Future<DonatePlaceDraft> build() async {
    if (id.isEmpty) return const DonatePlaceDraft();
    final place = await ref.read(getRecipientProvider).call(id);
    if (place == null) throw StateError('No such place.');
    return DonatePlaceDraft(
      id: place.id,
      name: place.name,
      kind: place.kind,
      district: place.district,
      area: place.area,
      story: place.story,
      needs: [
        for (final n in place.needs)
          (bookId: n.book.id, title: n.book.title, wanted: n.wanted),
      ],
    );
  }

  DonatePlaceDraft get _draft => state.requireValue;

  void edit(DonatePlaceDraft Function(DonatePlaceDraft) change) =>
      state = AsyncData(change(_draft));

  /// From the book picker: adds a Book (one copy) or takes it out.
  void pick(String bookId, bool add) => edit(
    (d) => d.copyWith(
      needs: add
          ? [...d.needs, (bookId: bookId, title: '', wanted: 1)]
          : [...d.needs.where((n) => n.bookId != bookId)],
    ),
  );

  void setCopies(String bookId, int wanted) => edit(
    (d) => d.copyWith(
      needs: [
        for (final n in d.needs)
          n.bookId == bookId
              ? (bookId: bookId, title: n.title, wanted: wanted)
              : n,
      ],
    ),
  );

  /// Saves the place; throws when the server refuses.
  Future<void> save() async {
    await ref.read(savePlaceProvider).call(_draft);
    ref.invalidate(recipientsProvider);
  }
}
