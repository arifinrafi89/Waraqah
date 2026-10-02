import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/book.dart';
import '../../../../core/models/edition.dart';

part 'book_draft.freezed.dart';

/// A Book as Staff fill it in on the form. No [id] = a new Book; the server
/// sets the id, the Author's name, Edition ids and the day it was added.
@freezed
abstract class BookDraft with _$BookDraft {
  const factory BookDraft({
    String? id,
    @Default('') String title,
    @Default('') String titleBn,
    @Default('') String authorId,
    @Default('') String publisherId,
    @Default(Section.academic) Section section,
    @Default('') String categoryId,
    @Default(BookLanguage.bangla) BookLanguage originalLanguage,
    @Default(0) int coverSeed,
    @Default(<Edition>[]) List<Edition> editions,
    @Default(<int>[]) List<int> classes,
    @Default(<Exam>[]) List<Exam> exams,
    @Default('') String subjectId,
  }) = _BookDraft;

  /// The form for an existing [book].
  factory BookDraft.of(Book book) => BookDraft(
    id: book.id,
    title: book.title,
    titleBn: book.titleBn ?? '',
    authorId: book.authorId,
    publisherId: book.publisherId,
    section: book.section,
    categoryId: book.categoryId,
    originalLanguage: book.originalLanguage,
    coverSeed: book.coverSeed,
    editions: book.editions,
    classes: book.classes,
    exams: book.exams,
    subjectId: book.subjectId ?? '',
  );
}
