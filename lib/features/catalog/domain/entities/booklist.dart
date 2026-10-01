import '../../../../core/models/book.dart';

enum BooklistKind { classList, examPrep, bookClub, personal }

/// Books needed together: a class list, exam prep, a book club pick (made
/// by Staff), or a Reader's own list. Bought together with "Add whole list
/// to cart". Not a Collection (picked, not bought together).
class Booklist {
  const Booklist({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.kind,
    required this.books,
    this.noteEn,
    this.noteBn,
    this.isMine = false,
  });

  final String id;
  final String titleEn;
  final String titleBn;
  final String? noteEn;
  final String? noteBn;
  final BooklistKind kind;

  /// In list order, hidden Books left out.
  final List<Book> books;

  /// The signed-in Reader's own list, which they can change.
  final bool isMine;

  String title(bool isBangla) => isBangla ? titleBn : titleEn;

  String? note(bool isBangla) => isBangla ? noteBn : noteEn;
}
