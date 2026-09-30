/// Who published a book.
class Publisher {
  const Publisher({required this.id, required this.name, this.nameBn});

  final String id;
  final String name;
  final String? nameBn;
}
