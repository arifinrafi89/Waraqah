import '../../../../core/models/book.dart';
import 'expert.dart';

/// Books picked by Staff, with a note on why. Not read in order (that's a
/// Series) and not bought together (that's a Booklist). With an [expert],
/// it's that Expert's Expert Pick.
class Collection {
  const Collection({
    required this.id,
    required this.titleEn,
    required this.titleBn,
    required this.noteEn,
    required this.noteBn,
    required this.books,
    this.section,
    this.expert,
  });

  final String id;
  final String titleEn;
  final String titleBn;
  final String noteEn;
  final String noteBn;

  /// `null` for a general Collection.
  final Section? section;

  /// Who picked it; `null` for Staff's own Collections.
  final Expert? expert;

  /// In the order Staff chose.
  final List<Book> books;

  String title(bool isBangla) => isBangla ? titleBn : titleEn;

  String note(bool isBangla) => isBangla ? noteBn : noteEn;
}
