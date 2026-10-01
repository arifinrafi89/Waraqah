import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';
// The fake backend sees the whole catalog, like the real server will.
import '../../../catalog/data/sources/book_fixtures.dart';
import '../../domain/entities/recipient.dart';

/// A verified place and what it asked for: (bookId, wanted, received).
class DonatePlace {
  const DonatePlace({
    required this.id,
    required this.name,
    required this.kind,
    required this.district,
    required this.area,
    required this.story,
    required this.needs,
  });

  final String id;
  final String name;
  final RecipientKind kind;
  final String district;
  final String area;
  final String story;
  final List<(String, int, int)> needs;
}

/// Three verified places so the Donate page isn't empty on a fresh start.
abstract final class DonateFixtures {
  static const List<DonatePlace> places = [
    DonatePlace(
      id: 'rc-aloghar',
      name: "Aloghar Children's Library",
      kind: RecipientKind.library,
      district: 'Rangpur',
      area: 'Pirgachha',
      story:
          'A reading room for about 300 village children, open every '
          'afternoon after school.',
      needs: [
        ('bk-hpstone', 10, 4),
        ('bk-hobbit', 6, 1),
        ('bk-sherlock', 5, 5),
      ],
    ),
    DonatePlace(
      id: 'rc-darul-ihsan',
      name: 'Darul Ihsan Madrasa',
      kind: RecipientKind.madrasa,
      district: 'Sylhet',
      area: 'Golapganj',
      story:
          'A madrasa of 180 students building its first library of '
          'hadith and seerah in Bangla.',
      needs: [('bk-riyad', 8, 3), ('bk-nectar', 8, 6), ('bk-adabmufrad', 5, 0)],
    ),
    DonatePlace(
      id: 'rc-shapla',
      name: "Shapla Girls' High School",
      kind: RecipientKind.school,
      district: 'Khulna',
      area: 'Dumuria',
      story:
          'Students share one copy of each book between five. The library '
          'wants copies they can take home.',
      needs: [
        ('bk-calculus', 12, 2),
        ('bk-sapiens', 6, 4),
        ('bk-atomic', 10, 7),
      ],
    ),
  ];

  static DonatePlace? place(String id) =>
      places.where((place) => place.id == id).firstOrNull;

  static Book? book(String id) =>
      BookFixtures.all.where((book) => book.id == id).firstOrNull;

  /// Donations are the cheapest printed edition that can be ordered.
  static Edition? printedEdition(Book book) {
    final printed = [
      for (final edition in book.editions)
        if (edition.format != BookFormat.ebook && edition.isOrderable) edition,
    ]..sort((a, b) => a.priceBdt.compareTo(b.priceBdt));
    return printed.firstOrNull;
  }
}
