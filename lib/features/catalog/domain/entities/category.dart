import '../../../../core/models/book.dart';

/// A subject shelf inside one [Section], e.g. "Fiction" in Literature.
class Category {
  const Category({
    required this.id,
    required this.section,
    required this.nameEn,
    required this.nameBn,
  });

  final String id;
  final Section section;
  final String nameEn;
  final String nameBn;
}
