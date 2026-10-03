import '../../domain/entities/donate_place_draft.dart';
import '../../domain/entities/recipient.dart';
import 'donate_fixtures.dart';

/// The verified places on the fake backend, which Staff change in the
/// Admin area, and how many copies donors sent each so far.
class DonatePlacesStore {
  DonatePlacesStore() {
    for (final place in DonateFixtures.places) {
      for (final (bookId, _, count) in place.needs) {
        received['${place.id}/$bookId'] = count;
      }
    }
  }

  final List<DonatePlace> places = [...DonateFixtures.places];

  /// Copies sent so far, by `placeId/bookId`.
  final Map<String, int> received = {};
  int _made = 0;

  DonatePlace? find(String id) =>
      places.where((place) => place.id == id).firstOrNull;

  /// Adds or replaces a place; `false` when it breaks [PlaceRules], names
  /// a Book the catalog doesn't have, or changes an unknown place.
  bool save(DonatePlaceDraft draft) {
    final old = draft.id.isEmpty ? null : find(draft.id);
    if (draft.id.isNotEmpty && old == null) return false;
    if (PlaceRules.check(draft) != null) return false;
    if (draft.needs.any((n) => DonateFixtures.book(n.bookId) == null)) {
      return false;
    }
    final place = DonatePlace(
      id: old?.id ?? 'rc-new-${++_made}',
      name: draft.name.trim(),
      kind: draft.kind,
      district: draft.district.trim(),
      area: draft.area.trim(),
      story: draft.story.trim(),
      needs: [for (final n in draft.needs) (n.bookId, n.wanted, 0)],
    );
    final at = old == null ? -1 : places.indexOf(old);
    at < 0 ? places.add(place) : places[at] = place;
    return true;
  }

  bool remove(String id) {
    final place = find(id);
    if (place == null) return false;
    places.remove(place);
    received.removeWhere((key, _) => key.startsWith('$id/'));
    return true;
  }

  /// A place as the API sends it, with the printed Edition donors buy.
  Map<String, Object?> json(DonatePlace place) => {
    'id': place.id,
    'name': place.name,
    'kind': place.kind.name,
    'district': place.district,
    'area': place.area,
    'story': place.story,
    'needs': [
      for (final (bookId, wanted, _) in place.needs)
        if (DonateFixtures.book(bookId) case final book?)
          if (DonateFixtures.printedEdition(book) case final edition?)
            {
              'book': book.toJson(),
              'editionId': edition.id,
              'priceBdt': edition.priceBdt,
              'wanted': wanted,
              'received': received['${place.id}/$bookId'] ?? 0,
            },
    ],
  };

  List<Map<String, Object?>> allJson() => [for (final p in places) json(p)];

  /// The draft a save request's body describes.
  static DonatePlaceDraft draftOf(Map<String, dynamic> body) =>
      DonatePlaceDraft(
        id: body['id'] as String? ?? '',
        name: body['name'] as String? ?? '',
        kind: RecipientKind.values.firstWhere(
          (k) => k.name == body['kind'],
          orElse: () => RecipientKind.library,
        ),
        district: body['district'] as String? ?? '',
        area: body['area'] as String? ?? '',
        story: body['story'] as String? ?? '',
        needs: [
          for (final n in (body['needs'] as List? ?? const []).cast<Map>())
            (
              bookId: '${n['bookId']}',
              title: '',
              wanted: n['wanted'] as int? ?? 0,
            ),
        ],
      );
}
