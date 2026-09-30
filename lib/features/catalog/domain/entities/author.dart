/// Who wrote a book. `Book.author` stays the display string; this is the record.
class Author {
  const Author({required this.id, required this.name, this.nameBn, this.bio});

  final String id;
  final String name;
  final String? nameBn;
  final String? bio;
}
