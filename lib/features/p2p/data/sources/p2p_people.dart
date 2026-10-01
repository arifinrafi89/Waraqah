/// A reader who buys or sells used books, as the fake backend knows them.
class P2pPerson {
  const P2pPerson({
    required this.id,
    required this.name,
    required this.area,
    required this.district,
    required this.memberSince,
    this.booksSold = 0,
  });

  final String id;
  final String name;
  final String area;
  final String district;
  final DateTime memberSince;

  /// Sold before the app's own records start.
  final int booksSold;
}

/// The readers in the demo marketplace. The fake backend has one signed-in
/// reader, [me] (like the cart and orders); the real server will know who
/// is asking from the login token.
abstract final class P2pPeople {
  static const String me = 'me';

  static final List<P2pPerson> all = [
    P2pPerson(
      id: me,
      name: 'You',
      area: 'Dhanmondi',
      district: 'Dhaka',
      memberSince: DateTime(2025, 2),
      booksSold: 2,
    ),
    P2pPerson(
      id: 'p-tanvir',
      name: 'Tanvir',
      area: 'Dhanmondi',
      district: 'Dhaka',
      memberSince: DateTime(2024, 8),
      booksSold: 11,
    ),
    P2pPerson(
      id: 'p-arif',
      name: 'Arif',
      area: 'Mirpur',
      district: 'Dhaka',
      memberSince: DateTime(2024, 3),
      booksSold: 6,
    ),
    P2pPerson(
      id: 'p-rakib',
      name: 'Rakib',
      area: 'GEC Circle',
      district: 'Chattogram',
      memberSince: DateTime(2025, 1),
      booksSold: 3,
    ),
    P2pPerson(
      id: 'p-nabila',
      name: 'Nabila',
      area: 'Banani',
      district: 'Dhaka',
      memberSince: DateTime(2023, 11),
      booksSold: 18,
    ),
    P2pPerson(
      id: 'p-talha',
      name: 'Talha',
      area: 'Motihar',
      district: 'Rajshahi',
      memberSince: DateTime(2024, 6),
      booksSold: 4,
    ),
    P2pPerson(
      id: 'p-mahi',
      name: 'Mahi',
      area: 'Uttara',
      district: 'Dhaka',
      memberSince: DateTime(2025, 4),
      booksSold: 1,
    ),
    P2pPerson(
      id: 'p-sadia',
      name: 'Sadia',
      area: 'Mohammadpur',
      district: 'Dhaka',
      memberSince: DateTime(2025, 6),
    ),
    P2pPerson(
      id: 'p-rafi',
      name: 'Rafi',
      area: 'Mirpur',
      district: 'Dhaka',
      memberSince: DateTime(2025, 7),
    ),
  ];

  static P2pPerson? find(String id) =>
      all.where((person) => person.id == id).firstOrNull;
}
